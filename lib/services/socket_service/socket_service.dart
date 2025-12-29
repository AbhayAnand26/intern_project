import 'package:flutter/foundation.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../session_manager/session_controller.dart';

class SocketService {
  static final SocketService _instance = SocketService._internal();
  factory SocketService() => _instance;
  SocketService._internal();

  IO.Socket? socket;
  bool isConnected = false;

  // ================= CONNECT =================
  void connect() {
    final user = SessionController.user;

    socket = IO.io(
      'https://chat-app-1-qvl9.onrender.com',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableReconnection()
          .build(),
    );

    socket!.onConnect((_) {
      isConnected = true;
      debugPrint('🟢 Socket connected');

      // 🔥 REQUIRED
      socket!.emit('user:connect', {
        'userId': user.userId,
        'username': user.username,
        'avatar': user.avatarUrl,
      });
    });

    socket!.onDisconnect((_) {
      isConnected = false;
      debugPrint('🔴 Socket disconnected');
    });
  }

  // ================= ROOM =================
  void joinRoom(String roomId) {
    final user = SessionController.user;

    socket?.emit('room:join', {
      'roomId': roomId,
      'user': {
        'id': user.userId,
        'username': user.username,
        'avatar': user.avatarUrl,
      },
    });
  }

  // ================= MIC =================
  void muteMic() => socket?.emit('mic:mute');
  void unmuteMic() => socket?.emit('mic:unmute');
  void speaking(bool speaking) => socket?.emit('mic:speaking', speaking);

  // ================= CHAT =================
  void sendMessage(String roomId, String text) {
    socket?.emit('message:send', {
      'roomId': roomId,
      'text': text, // ✅ correct key
    });
  }

  void onMessage(void Function(dynamic) cb) {
    socket?.on('message:receive', cb);
  }

  // ================= ROOM EVENTS =================
  void onRoomUsers(void Function(List<dynamic>) cb) {
    socket?.on('room:users', (data) => cb(List.from(data)));
  }

  void onUserJoined(void Function(dynamic) cb) {
    socket?.on('room:userJoined', cb);
  }

  void onUserLeft(void Function(dynamic) cb) {
    socket?.on('room:userLeft', cb);
  }

  void onMicUpdate(void Function(dynamic) cb) {
    socket?.on('mic:update', cb);
  }

  // ================= WEBRTC =================
  void sendOffer(String to, Map<String, dynamic> offer) {
    socket?.emit('call:offer', {'to': to, 'offer': offer});
  }

  void sendAnswer(String to, Map<String, dynamic> answer) {
    socket?.emit('call:answer', {'to': to, 'answer': answer});
  }

  void sendIce(String to, Map<String, dynamic> candidate) {
    socket?.emit('call:ice', {'to': to, 'candidate': candidate});
  }

  void onOffer(void Function(dynamic) cb) => socket?.on('call:offer', cb);

  void onAnswer(void Function(dynamic) cb) => socket?.on('call:answer', cb);

  void onIce(void Function(dynamic) cb) => socket?.on('call:ice', cb);

  // ================= CLEANUP =================
  void disconnect() {
    socket?.disconnect();
    socket?.dispose();
    socket = null;
    isConnected = false;
  }
}
