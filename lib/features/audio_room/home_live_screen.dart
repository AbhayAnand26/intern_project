import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../model/my_room_model/room_list_model.dart';
import '../../../services/socket_service/socket_service.dart';
import '../../../services/socket_service/room_service.dart';
import '../../../services/session_manager/session_controller.dart';

const Map<String, dynamic> rtcConfig = {
  "iceServers": [
    {"urls": "stun:stun.l.google.com:19302"},
    {"urls": "stun:stun1.l.google.com:19302"},
  ],
  "sdpSemantics": "unified-plan", // 🔥 Add this
};

class HomeLiveScreen extends StatefulWidget {
  final Room room;
  const HomeLiveScreen({super.key, required this.room});

  @override
  State<HomeLiveScreen> createState() => _HomeLiveScreenState();
}

class _HomeLiveScreenState extends State<HomeLiveScreen> {
  static const int totalSlots = 12;

  final SocketService _socket = SocketService();
  final RoomService _roomService = RoomService();
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final Map<String, RTCPeerConnection> _peers = {};
  final Map<String, RTCVideoRenderer> _audioRenderers = {};
  final Map<String, List<RTCIceCandidate>> _iceQueue = {};

  MediaStream? _localStream;

  bool _joined = false;
  bool _loading = false;
  bool _isMuted = true;

  List<dynamic> _participants = [];
  List<String> _messages = [];

  late final String _bgUrl;
  final _bgImages = [
    "https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe",
    "https://images.unsplash.com/photo-1557683316-973673baf926",
  ];

  final String myId = SessionController.user.userId;

  @override
  void initState() {
    super.initState();
    _bgUrl = _bgImages[Random().nextInt(_bgImages.length)];
    // Wait for the first frame to be drawn before starting heavy WebRTC/Socket work
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
  }

  Future<void> _init() async {
    try {
      var status = await Permission.microphone.request();
      if (status.isDenied) {
        _showSnack("Microphone permission is required for audio rooms.");
        return;
      }

      _localStream = await navigator.mediaDevices.getUserMedia({
        "audio": {
          "echoCancellation": true,
          "noiseSuppression": true,
          "autoGainControl": true,
        },
        "video": false,
      });

      _localStream!.getAudioTracks().first.enabled = false;
      _initSocket();
    } catch (e) {
      print("Error initializing WebRTC: $e");
    }
  }

  /* ================= SOCKET ================= */

  void _initSocket() {
    _socket.connect(); // must be first

    _socket.onRoomUsers((users) async {
      _participants = users;
      _joined = true;
      _loading = false;
      setState(() {});

      for (final u in users) {
        if (u['id'] != myId) {
          await _createPeer(u['id'], offer: false);
        }
      }
    });

    _socket.onUserJoined((user) async {
      if (user['id'] == myId) return;
      _participants.add(user);
      setState(() {});
      await _createPeer(user['id'], offer: true);
    });

    _socket.onUserLeft((data) {
      final id = data['userId'];
      _peers[id]?.close();
      _peers.remove(id);
      _audioRenderers[id]?.dispose();
      _audioRenderers.remove(id);
      _participants.removeWhere((u) => u['id'] == id);
      setState(() {});
    });

    _registerWebRTCEvents();
  }

  /* ================= WEBRTC ================= */

  Future<void> _createPeer(String userId, {bool offer = false}) async {
    if (_peers.containsKey(userId)) return;

    final pc = await createPeerConnection(rtcConfig);
    _peers[userId] = pc;

    // 🔥 Add local audio track
    final audioTracks = _localStream?.getAudioTracks() ?? [];
    for (final track in audioTracks) {
      pc.addTrack(track, _localStream!);
      print("[WebRTC] Added local audio track ${track.id} to peer $userId");
    }

    // ICE Candidate
    pc.onIceCandidate = (c) {
      if (c != null) {
        _socket.sendIce(userId, c.toMap());
        print(
          "[WebRTC] ICE candidate generated for peer $userId: ${c.candidate}",
        );
      }
    };

    // Remote track received
    pc.onTrack = (event) {
      if (event.track.kind == 'audio') {
        print("[WebRTC] Received remote audio track from peer $userId");

        // 🔥 FIX: Assign the remote stream to a renderer (even if hidden)
        // This triggers the native side to route audio to speakers.
        if (event.streams.isNotEmpty) {
          _initAudioRenderer(userId, event.streams[0]);
        }

        Helper.setSpeakerphoneOn(true);
      }
    };

    if (offer) {
      final offerDesc = await pc.createOffer();
      await pc.setLocalDescription(offerDesc);
      _socket.sendOffer(userId, offerDesc.toMap());
      print("[WebRTC] Offer created & sent to peer $userId");
    }
  }

  // 🔥 ADD THIS HELPER METHOD
  Future<void> _initAudioRenderer(String userId, MediaStream stream) async {
    if (!_audioRenderers.containsKey(userId)) {
      final renderer = RTCVideoRenderer();
      await renderer.initialize();
      renderer.srcObject = stream;
      _audioRenderers[userId] = renderer;
      setState(() {}); // Refresh to ensure renderer is active
    }
  }

  void _registerWebRTCEvents() {
    _socket.onOffer((data) async {
      final from = data['from'];
      if (!_peers.containsKey(from)) await _createPeer(from, offer: false);
      final pc = _peers[from]!;

      await pc.setRemoteDescription(
        RTCSessionDescription(data['offer']['sdp'], data['offer']['type']),
      );

      // 🔥 ADD THIS: Process candidates that arrived before the offer
      _processQueuedIceCandidates(from);

      final answer = await pc.createAnswer();
      await pc.setLocalDescription(answer);
      _socket.sendAnswer(from, answer.toMap());
    });

    _socket.onAnswer((data) async {
      final from = data['from'];
      final pc = _peers[from];
      if (pc == null) return;

      await pc.setRemoteDescription(
        RTCSessionDescription(data['answer']['sdp'], data['answer']['type']),
      );

      // 🔥 ADD THIS: Process candidates that arrived before the answer
      _processQueuedIceCandidates(from);
    });

    _socket.onIce((data) async {
      final from = data['from'];
      final pc = _peers[from];
      if (pc == null) return;

      final candidate = RTCIceCandidate(
        data['candidate']['candidate'],
        data['candidate']['sdpMid'],
        data['candidate']['sdpMLineIndex'],
      );

      final remoteDesc = await pc.getRemoteDescription();
      if (remoteDesc == null) {
        _iceQueue.putIfAbsent(from, () => []).add(candidate);
      } else {
        await pc.addCandidate(candidate);
      }
    });
  }

  // 🔥 ADD THIS HELPER METHOD to the _HomeLiveScreenState class
  void _processQueuedIceCandidates(String userId) async {
    if (_iceQueue.containsKey(userId)) {
      for (var candidate in _iceQueue[userId]!) {
        await _peers[userId]?.addCandidate(candidate);
      }
      _iceQueue.remove(userId);
      print("[WebRTC] Flushed ICE queue for $userId");
    }
  }

  // 🔊 Log mic toggle
  void _toggleMic() {
    if (_localStream == null) return;

    _isMuted = !_isMuted;
    _localStream!.getAudioTracks().forEach((track) {
      track.enabled = !_isMuted;
    });

    _isMuted ? _socket.muteMic() : _socket.unmuteMic();
    setState(() {});
  }

  /* ================= ACTIONS ================= */

  Future<void> _joinRoom() async {
    if (_joined || _loading) return;
    setState(() => _loading = true);

    final ok = await _roomService.joinRoom(widget.room.roomId);
    if (!ok) {
      _loading = false;
      setState(() {});
      return;
    }

    _socket.joinRoom(widget.room.roomId);
  }

  // void _toggleMic() {
  //   _isMuted = !_isMuted;
  //   _localStream!.getAudioTracks().first.enabled = !_isMuted;

  //   _isMuted ? _socket.muteMic() : _socket.unmuteMic();
  //   setState(() {});
  // }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    _socket.sendMessage(widget.room.roomId, text);
    _messageController.clear();
  }

  void _addMessage(String message) {
    if (!mounted) return;
    setState(() {
      _messages.add(message);
      if (_messages.length > 50) _messages.removeAt(0);
    });

    // Auto-scroll to the bottom (since your list is likely not reversed in a way that handles this automatically)
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0, // Since your ListView uses 'reverse: true', 0 is the bottom
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _socket.disconnect();
    _localStream?.dispose();
    for (final pc in _peers.values) {
      pc.close();
    }
    for (final r in _audioRenderers.values) {
      try {
        r.dispose();
      } catch (_) {}
    }
    _messageController.dispose();
    super.dispose();
  }

  /* ================= UI ================= */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(child: Image.network(_bgUrl, fit: BoxFit.cover)),
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.7)),
          ),
          SafeArea(
            child: Column(
              children: [
                _header(),
                _liveIndicator(),
                Expanded(child: _grid()),
                _messagesList(),
                _controls(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _header() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    child: Row(
      children: [
        // Room creator avatar
        CircleAvatar(
          radius: 24,
          backgroundImage: widget.room.creatorAvatar.isNotEmpty
              ? NetworkImage(widget.room.creatorAvatar)
              : null,
          backgroundColor: Colors.white12,
          child: widget.room.creatorAvatar.isEmpty
              ? const Icon(Icons.person, color: Colors.white)
              : null,
        ),
        const SizedBox(width: 12),
        // Room title and category
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.room.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                widget.room.category,
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ),
        // Join / Leave button
        _joined
            ? ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const Text("Leave"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                ),
              )
            : ElevatedButton(
                onPressed: _joinRoom,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                ),
                child: _loading
                    ? const SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        "JOIN",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
      ],
    ),
  );

  Widget _liveIndicator() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      children: [
        // Live badge with animated dot
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.redAccent, Colors.orangeAccent],
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.redAccent.withOpacity(0.5),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              const Text(
                "LIVE",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Text(
          "${_participants.length} online",
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
      ],
    ),
  );

  Widget _grid() {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(12),
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
          childAspectRatio: 0.68,
        ),
        itemCount: totalSlots,
        itemBuilder: (_, index) {
          if (index < _participants.length) {
            final u = _participants[index];

            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: _userTile(
                key: ValueKey(u['id']), // 🔥 important
                name: u['username'] ?? 'User',
                avatar: u['avatar'],
                active: true,
                muted: u['mic']?['muted'] ?? true,
                isHost: u['role'] == 'host',
              ),
            );
          }

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: _userTile(
              key: ValueKey('empty-$index'),
              name: "Empty",
              active: false,
              muted: true,
            ),
          );
        },
      ),
    );
  }

  Widget _userTile({
    required String name,
    String? avatar,
    required bool active,
    bool muted = true,
    bool isHost = false,
    Key? key,
  }) {
    return SizedBox(
      key: key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min, // 🔒 prevents overflow
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              // USER AVATAR
              CircleAvatar(
                radius: 24, // ✅ final safe size
                backgroundColor: active
                    ? Colors.greenAccent.shade700
                    : Colors.white12,
                backgroundImage: avatar != null ? NetworkImage(avatar) : null,
                child: avatar == null
                    ? Text(
                        name.isNotEmpty ? name[0].toUpperCase() : "?",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : null,
              ),

              // 🔇 MUTED ICON
              if (muted)
                Positioned(
                  bottom: -2,
                  right: -2,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black87,
                    ),
                    child: const Icon(
                      Icons.mic_off,
                      size: 10,
                      color: Colors.redAccent,
                    ),
                  ),
                ),

              // 👑 HOST BADGE
              if (isHost)
                Positioned(
                  top: -2,
                  right: -2,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amber,
                    ),
                    child: const Icon(
                      Icons.star,
                      size: 10,
                      color: Colors.black,
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 4),

          // USER NAME
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: active ? Colors.white : Colors.white38,
                fontSize: 11,
                fontWeight: active ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _messagesList() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    height: 120,
    child: ListView.builder(
      controller: _scrollController, // <--- Add the controller here
      reverse: true,
      itemCount: _messages.length,
      itemBuilder: (_, i) {
        // Since reverse is true, index 0 is the bottom-most message
        final message = _messages[_messages.length - 1 - i];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              shadows: [Shadow(blurRadius: 2, color: Colors.black)],
            ),
          ),
        );
      },
    ),
  );

  Widget _controls() {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.75),
          border: const Border(top: BorderSide(color: Colors.white12)),
        ),
        child: Row(
          children: [
            /// MIC BUTTON
            GestureDetector(
              onTap: () {
                if (!_joined) {
                  _showSnack("Join the room first to speak 🎤");
                  return;
                }
                _toggleMic();
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: !_joined
                      ? Colors.grey.shade700
                      : _isMuted
                      ? Colors.redAccent
                      : Colors.green,
                  shape: BoxShape.circle,
                  boxShadow: _joined
                      ? [
                          BoxShadow(
                            color: (_isMuted ? Colors.redAccent : Colors.green)
                                .withOpacity(0.5),
                            blurRadius: 8,
                          ),
                        ]
                      : [],
                ),
                child: Icon(
                  _isMuted ? Icons.mic_off : Icons.mic,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(width: 12),

            /// MESSAGE INPUT
            Expanded(
              child: TextField(
                controller: _messageController,
                enabled: _joined,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: _joined
                      ? "Say something..."
                      : "Join the room to chat",
                  hintStyle: const TextStyle(color: Colors.white38),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                  filled: true,
                  fillColor: Colors.white12,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
                onSubmitted: (_) => _sendMessage(),
              ),
            ),

            const SizedBox(width: 12),

            /// SEND BUTTON
            GestureDetector(
              onTap: () {
                if (!_joined) {
                  _showSnack("Join the room first to send messages 💬");
                  return;
                }
                _sendMessage();
              },
              child: CircleAvatar(
                radius: 22,
                backgroundColor: _joined
                    ? Colors.blueAccent
                    : Colors.grey.shade700,
                child: const Icon(Icons.send, color: Colors.white, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.black87,
        margin: const EdgeInsets.all(12),
      ),
    );
  }
}
