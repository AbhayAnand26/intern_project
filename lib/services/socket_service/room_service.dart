import 'package:dio/dio.dart';
import '../session_manager/session_controller.dart';

class RoomService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: 'https://chat-app-1-qvl9.onrender.com'),
  );

  Future<bool> joinRoom(String roomId) async {
    try {
      final res = await _dio.post(
        '/api/rooms/$roomId/join',
        options: Options(
          headers: {'Authorization': 'Bearer ${SessionController.user.token}'},
        ),
      );
      return res.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  Future<void> leaveRoom(String roomId) async {
    await _dio.post(
      '/api/rooms/$roomId/leave',
      options: Options(
        headers: {'Authorization': 'Bearer ${SessionController.user.token}'},
      ),
    );
  }
}
