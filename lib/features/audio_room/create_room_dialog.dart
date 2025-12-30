import 'package:flutter/material.dart';
import '../../services/socket_service/room_service.dart';

class CreateRoomDialog extends StatefulWidget {
  const CreateRoomDialog({super.key});

  @override
  State<CreateRoomDialog> createState() => _CreateRoomDialogState();
}

class _CreateRoomDialogState extends State<CreateRoomDialog> {
  final _formKey = GlobalKey<FormState>();
  final RoomService _roomService = RoomService();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String _selectedMode = 'Audio'; // Must match backend enum exactly
  String _selectedCategory = 'casual';
  String _selectedPrivacy = 'public';
  int _maxParticipants = 50;
  bool _isLoading = false;

  final List<String> modes = ['Audio', 'Video']; // Only backend-valid modes
  final List<String> categories = [
    'casual',
    'professional',
    'educational',
    'entertainment',
    'music',
    'sports',
    'gaming',
  ];
  final List<String> privacyOptions = ['public', 'private'];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _createRoom() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final room = await _roomService.createRoom(
        title: _titleController.text.trim(),
        mode: _selectedMode, // Always backend-valid
        category: _selectedCategory,
        description: _descriptionController.text.trim(),
        privacy: _selectedPrivacy,
        maxParticipants: _maxParticipants,
      );

      if (mounted) {
        if (room != null) {
          Navigator.pop(context, room);
          _showSnackBar('Room created successfully!', Colors.green);
        } else {
          _showSnackBar('Failed to create room', Colors.red);
        }
      }
    } catch (e) {
      if (mounted) _showSnackBar('Error: $e', Colors.red);
    } finally {
      if (mounted) setState(() => _isLoading = false);
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

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Create Room', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
                ],
              ),
              const SizedBox(height: 16),

              // Room Title
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Room Title',
                  hintText: 'e.g., Flutter Discussion',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  prefixIcon: const Icon(Icons.title),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) return 'Please enter a room title';
                  if (value.length < 3) return 'Title must be at least 3 characters';
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Room Description
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description (Optional)',
                  hintText: 'Describe your room...',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  prefixIcon: const Icon(Icons.description),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),

              // Mode Selection
              Text('Room Mode', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              SegmentedButton<String>(
                segments: modes.map((mode) => ButtonSegment<String>(value: mode, label: Text(mode.toUpperCase()))).toList(),
                selected: {_selectedMode},
                onSelectionChanged: (newSelection) {
                  setState(() => _selectedMode = newSelection.first);
                },
              ),
              const SizedBox(height: 16),

              // Category Selection
              Text('Category', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                items: categories.map((category) => DropdownMenuItem(value: category, child: Text(category))).toList(),
                onChanged: (value) { if (value != null) setState(() => _selectedCategory = value); },
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  prefixIcon: const Icon(Icons.category),
                ),
              ),
              const SizedBox(height: 16),

              // Privacy Selection
              Text('Privacy', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              SegmentedButton<String>(
                segments: privacyOptions.map((privacy) => ButtonSegment<String>(value: privacy, label: Text(privacy.toUpperCase()))).toList(),
                selected: {_selectedPrivacy},
                onSelectionChanged: (newSelection) { setState(() => _selectedPrivacy = newSelection.first); },
              ),
              const SizedBox(height: 16),

              // Max Participants Slider
              Text('Max Participants: $_maxParticipants', style: Theme.of(context).textTheme.titleMedium),
              Slider(
                value: _maxParticipants.toDouble(),
                min: 2,
                max: 500,
                divisions: 50,
                label: _maxParticipants.toString(),
                onChanged: (value) { setState(() => _maxParticipants = value.toInt()); },
              ),
              const SizedBox(height: 24),

              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: _isLoading ? null : () => Navigator.pop(context), child: const Text('Cancel')),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: _isLoading ? null : _createRoom,
                    icon: _isLoading ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.add),
                    label: Text(_isLoading ? 'Creating...' : 'Create Room'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
