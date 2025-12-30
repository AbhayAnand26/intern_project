import 'package:flutter/material.dart';

// Quick Integration Example
// This shows how to integrate the voice room feature into your existing app

class IntegrationExample extends StatelessWidget {
  const IntegrationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Voice Rooms Integration')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ============================================
          // OPTION 1: Simple Button to Open RoomsScreen
          // ============================================
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Option 1: Navigate to Rooms Screen',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Navigate to RoomsScreen
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (_) => const RoomsScreen(),
                      //   ),
                      // );
                    },
                    icon: const Icon(Icons.mic),
                    label: const Text('Open Voice Rooms'),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Import: import \'path_to/features/audio_room/rooms_screen.dart\';',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // ============================================
          // OPTION 2: Programmatically Create a Room
          // ============================================
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Option 2: Create Room Programmatically',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () => _exampleCreateRoom(context),
                    icon: const Icon(Icons.add),
                    label: const Text('Create Room Example'),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Call RoomService.createRoom() directly without dialog',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // ============================================
          // OPTION 3: Show Create Room Dialog Only
          // ============================================
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Option 3: Show Create Room Dialog',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () => _exampleShowDialog(context),
                    icon: const Icon(Icons.create),
                    label: const Text('Show Dialog'),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Show CreateRoomDialog independently',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // ============================================
          // CODE SNIPPETS SECTION
          // ============================================
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Code Snippets',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _CodeSnippet(
                    title: '1. Import RoomService',
                    code:
                        '''import 'path_to/services/socket_service/room_service.dart';''',
                  ),
                  const SizedBox(height: 12),
                  _CodeSnippet(
                    title: '2. Create Room Service Instance',
                    code: '''final roomService = RoomService();''',
                  ),
                  const SizedBox(height: 12),
                  _CodeSnippet(
                    title: '3. Create a Room',
                    code: '''final room = await roomService.createRoom(
  title: 'My Room',
  mode: 'audio',
  category: 'casual',
);''',
                  ),
                  const SizedBox(height: 12),
                  _CodeSnippet(
                    title: '4. Join a Room',
                    code:
                        '''final joined = await roomService.joinRoom('roomId123');
if (joined) {
  // Navigate to HomeLiveScreen
}''',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _exampleCreateRoom(BuildContext context) async {
    // Example: Create room programmatically
    print('Creating room programmatically...');
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('See console for example')));

    // Example code (uncomment to use):
    /*
    final roomService = RoomService();
    try {
      final room = await roomService.createRoom(
        title: 'Quick Meeting',
        mode: 'audio',
        category: 'professional',
        privacy: 'private',
        maxParticipants: 10,
      );
      
      if (room != null) {
        print('Room created: ${room.title}');
        // TODO: Navigate to HomeLiveScreen
      }
    } catch (e) {
      print('Error: $e');
    }
    */
  }

  Future<void> _exampleShowDialog(BuildContext context) async {
    // Example: Show create room dialog
    print('Showing create room dialog...');

    // Example code (uncomment to use):
    /*
    final result = await showDialog<Room?>(
      context: context,
      builder: (_) => const CreateRoomDialog(),
    );
    
    if (result != null) {
      print('Room created: ${result.title}');
      // Navigate or handle result
    }
    */
  }
}

// ============================================
// Helper Widget for Code Display
// ============================================
class _CodeSnippet extends StatelessWidget {
  final String title;
  final String code;

  const _CodeSnippet({required this.title, required this.code});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: SelectableText(
            code,
            style: const TextStyle(fontFamily: 'Courier', fontSize: 11),
          ),
        ),
      ],
    );
  }
}

// ============================================
// INTEGRATION CHECKLIST
// ============================================
/*

STEP-BY-STEP INTEGRATION:

1. ✅ RoomService.createRoom() is ready
   - Location: lib/services/socket_service/room_service.dart
   - Method: createRoom({title, mode, category, ...})

2. ✅ CreateRoomDialog is ready
   - Location: lib/features/audio_room/create_room_dialog.dart
   - Use: showDialog<Room?>(context, builder: (_) => CreateRoomDialog())

3. ✅ RoomsScreen is ready
   - Location: lib/features/audio_room/rooms_screen.dart
   - Use: Navigator.push(context, MaterialPageRoute(builder: (_) => RoomsScreen()))

4. Next Steps:
   - Add imports to your files
   - Add navigation routes if using named routing
   - Test with backend API
   - Handle token management in SessionController
   - Set up proper error handling

USAGE EXAMPLES:

// Example 1: Full Room Creation & Join Flow
void createAndJoinRoom() async {
  final roomService = RoomService();
  
  // Create room
  final room = await roomService.createRoom(
    title: 'Test Room',
    mode: 'audio',
    category: 'casual',
  );
  
  if (room != null) {
    // Join room
    final joined = await roomService.joinRoom(room.roomId);
    if (joined) {
      // Connect socket and navigate
    }
  }
}

// Example 2: Just Show Rooms List
void showRooms() {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (_) => const RoomsScreen()),
  );
}

// Example 3: Just Show Create Dialog
void showCreateDialog() {
  showDialog<Room?>(
    context: context,
    builder: (_) => const CreateRoomDialog(),
  ).then((room) {
    if (room != null) {
      print('Created room: ${room.title}');
    }
  });
}

API ENDPOINTS:
1. POST https://chat-app-1-qvl9.onrender.com/api/rooms/create
   Request: {title, mode, category, description?, privacy?, maxParticipants?, tags?}
   Response: {room: Room}

2. POST https://chat-app-1-qvl9.onrender.com/api/rooms/:roomId/join
   Request: {}
   Response: {success: boolean}

AUTHENTICATION:
- All requests include: Authorization: Bearer {user.token}
- Ensure SessionController.user is initialized before API calls

SOCKET EVENTS:
- After joining, WebSocket connects for real-time events
- Handled by SocketService
- WebRTC setup begins in HomeLiveScreen

*/
