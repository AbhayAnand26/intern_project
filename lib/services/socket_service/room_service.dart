import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../model/my_room_model/room_list_model.dart';
import '../session_manager/session_controller.dart';

class RoomService {
  late final Dio _dio;

  RoomService() {
    _dio = Dio(
      BaseOptions(baseUrl: 'https://chat-app-1-qvl9.onrender.com'),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = SessionController.user.token;
          if (token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (error, handler) {
          debugPrint('❌ API Error: ${error.response?.statusCode}');
          debugPrint('❌ Message: ${error.response?.data}');
          return handler.next(error);
        },
      ),
    );
  }

  /// Fetch rooms list
  Future<List<Room>> fetchRooms() async {
    try {
      debugPrint('🔄 Fetching rooms list...');
      final res = await _dio.get('/api/rooms/list'); // Update to actual backend path

      if (res.statusCode == 200) {
        final dynamic data = res.data;
        if (data is Map<String, dynamic> && data.containsKey('rooms')) {
          final roomsJson = data['rooms'] as List<dynamic>;
          return roomsJson.map((json) => Room.fromJson(json as Map<String, dynamic>)).toList();
        } else if (data is List) {
          return data.map((json) => Room.fromJson(json as Map<String, dynamic>)).toList();
        }
      }
      debugPrint('⚠️ Unexpected status code: ${res.statusCode}');
      return [];
    } on DioException catch (e) {
      debugPrint('❌ Error fetching rooms: ${e.response?.statusCode}');
      debugPrint('❌ Response: ${e.response?.data}');
      return [];
    } catch (e) {
      debugPrint('❌ Unexpected error fetching rooms: $e');
      return [];
    }
  }

  /// Create a new room
  Future<Room?> createRoom({
    required String title,
    required String mode, // e.g., 'audio', 'video'
    required String category,
    String? description,
    String? coverImage,
    String? privacy,
    int? maxParticipants,
    List<String>? tags,
  }) async {
    try {
      final formattedMode = mode.toLowerCase(); // Force lowercase
      debugPrint('🔄 Creating room: $title');
      debugPrint('⚙️ Mode after formatting: $formattedMode');
      debugPrint('🔑 Token: ${SessionController.user.token}');

      final res = await _dio.post(
        '/api/rooms/create',
        data: {
          'title': title,
          'mode': formattedMode,
          'category': category,
          'description': description,
          'coverImage': coverImage,
          'privacy': privacy ?? 'public',
          'maxParticipants': maxParticipants,
          'tags': tags ?? [],
        },
      );

      debugPrint('✅ Room created successfully: ${res.data}');

      if (res.statusCode == 201 || res.statusCode == 200) {
        final roomData = res.data['room'] ?? res.data;
        return Room.fromJson(roomData as Map<String, dynamic>);
      }
      return null;
    } on DioException catch (e) {
      debugPrint('❌ Error creating room: ${e.response?.statusCode}');
      debugPrint('❌ Response: ${e.response?.data}');
      return null;
    } catch (e) {
      debugPrint('❌ Unexpected error: $e');
      return null;
    }
  }

  /// Join existing room
  Future<bool> joinRoom(String roomId) async {
    try {
      final res = await _dio.post('/api/rooms/$roomId/join');
      return res.statusCode == 200 || res.statusCode == 201;
    } catch (e) {
      debugPrint('❌ Error joining room: $e');
      return false;
    }
  }

  Future<void> leaveRoom(String roomId) async {
    try {
      await _dio.post('/api/rooms/$roomId/leave');
      debugPrint('✅ Left room successfully');
    } catch (e) {
      debugPrint('❌ Error leaving room: $e');
    }
  }
}
