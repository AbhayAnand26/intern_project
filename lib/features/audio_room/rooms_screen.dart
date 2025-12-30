import 'package:flutter/material.dart';

import '../../model/my_room_model/room_list_model.dart';
import '../../services/socket_service/room_service.dart';
import '../../services/socket_service/socket_service.dart';
import 'create_room_dialog.dart';
import 'home_live_screen.dart';

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({super.key});

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  final RoomService _roomService = RoomService();
  final SocketService _socket = SocketService();

  final List<Room> _rooms = [];
  bool _isLoading = true;
  String _selectedFilter = 'all';

  final List<String> filterOptions = ['all', 'public', 'private', 'active'];

  @override
  void initState() {
    super.initState();
    _loadRooms();
  }

  Future<void> _loadRooms() async {
    setState(() => _isLoading = true);
    final rooms = await _roomService.fetchRooms();
    if (mounted) {
      setState(() {
        _rooms.clear();
        _rooms.addAll(rooms);
        _isLoading = false;
      });
    }
  }

  Future<void> _createNewRoom() async {
    final result = await showDialog<Room?>(
      context: context,
      builder: (_) => const CreateRoomDialog(),
    );

    if (result != null && mounted) {
      // Room created successfully, navigate to it
      await _joinRoom(result);
      _loadRooms(); // Refresh rooms list after creation
    }
  }

  Future<void> _joinRoom(Room room) async {
    try {
      final joined = await _roomService.joinRoom(room.roomId);
      if (!joined) {
        if (mounted) _showSnackBar('Failed to join room', Colors.red);
        return;
      }

      _socket.connect();
      _socket.joinRoom(room.roomId);

      if (mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => HomeLiveScreen(room: room)),
        );
      }
    } catch (e) {
      if (mounted) _showSnackBar('Error: $e', Colors.red);
    }
  }

  void _showSnackBar(String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  List<Room> get _filteredRooms {
    if (_selectedFilter == 'all') return _rooms;
    if (_selectedFilter == 'public') return _rooms.where((r) => r.privacy == 'public').toList();
    if (_selectedFilter == 'private') return _rooms.where((r) => r.privacy == 'private').toList();
    if (_selectedFilter == 'active') return _rooms.where((r) => r.isActive).toList();
    return _rooms;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice Rooms'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadRooms,
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Section
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: filterOptions
                  .map(
                    (filter) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(filter.toUpperCase()),
                    selected: _selectedFilter == filter,
                    onSelected: (_) {
                      setState(() => _selectedFilter = filter);
                    },
                  ),
                ),
              )
                  .toList(),
            ),
          ),
          // Rooms List
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _filteredRooms.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.mic_none, size: 64, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  Text(
                    'No rooms available',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Create a new room to get started',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: _filteredRooms.length,
              itemBuilder: (context, index) {
                final room = _filteredRooms[index];
                return _buildRoomCard(room);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _createNewRoom,
        icon: const Icon(Icons.add),
        label: const Text('Create Room'),
      ),
    );
  }

  Widget _buildRoomCard(Room room) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            room.creator.email.isNotEmpty
                ? 'https://api.dicebear.com/7.x/avataaars/svg?seed=${room.creator.email}'
                : 'https://via.placeholder.com/150',
          ),
          radius: 28,
        ),
        title: Text(
          room.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              'by ${room.creatorName}',
              style: Theme.of(context).textTheme.bodySmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Chip(
                  label: Text(
                    room.mode.toUpperCase(),
                    style: const TextStyle(fontSize: 10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  backgroundColor: room.mode == 'audio'
                      ? Colors.blue.withOpacity(0.3)
                      : Colors.green.withOpacity(0.3),
                ),
                const SizedBox(width: 8),
                Chip(
                  label: Text(
                    '${room.participants.length}/${room.maxParticipants ?? 'Unlimited'}',
                    style: const TextStyle(fontSize: 10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                ),
              ],
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: room.isActive ? Colors.green : Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              room.isActive ? 'LIVE' : 'OFF',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: room.isActive ? Colors.green : Colors.grey,
              ),
            ),
          ],
        ),
        onTap: () => _joinRoom(room),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
