import '../model/auth_model/user_model.dart';
import '../storage/local_storage.dart';
import 'package:flutter/foundation.dart';

class SessionController {
  final LocalStorage _storage = LocalStorage();

  static final SessionController _instance = SessionController._internal();
  static bool isLogin = false;
  static UserModel user = UserModel();

  SessionController._internal();
  factory SessionController() => _instance;

  /// ================= SAVE TOKEN =================
  Future<void> saveToken(String token) async {
    debugPrint('🔐 [Session] Saving token...');
    debugPrint('🔐 [Session] Token => $token');

    await _storage.setValue('token', token);
    await _storage.setValue('isLogin', 'true');

    user = user.copyWith(token: token);
    isLogin = true;

    debugPrint('✅ [Session] Token saved successfully');
    debugPrint('👤 [Session] Current user => $user');
  }

  /// ================= SAVE FIRST PARTICIPANT =================
  Future<void> saveFirstParticipant({
    required String userId,
    required String username,
    required String avatarUrl,
  }) async {
    debugPrint('👥 [Session] Saving first participant...');
    debugPrint('👤 userId    => $userId');
    debugPrint('👤 username  => $username');
    debugPrint('👤 avatarUrl => $avatarUrl');

    await _storage.setValue('userId', userId);
    await _storage.setValue('username', username);
    await _storage.setValue('avatarUrl', avatarUrl);

    user = user.copyWith(
      userId: userId,
      username: username,
      avatarUrl: avatarUrl,
    );

    debugPrint('✅ [Session] Participant saved successfully');
    debugPrint('👤 [Session] Current user => $user');
  }

  /// ================= RESTORE SESSION =================
  Future<void> getUserFromPreference() async {
    debugPrint('🔄 [Session] Restoring user from local storage...');

    final token = await _storage.readValue('token');
    final userId = await _storage.readValue('userId');
    final username = await _storage.readValue('username');
    final avatarUrl = await _storage.readValue('avatarUrl');
    final isLoginStatus = await _storage.readValue('isLogin');

    debugPrint('📦 [Storage] token      => $token');
    debugPrint('📦 [Storage] userId     => $userId');
    debugPrint('📦 [Storage] username   => $username');
    debugPrint('📦 [Storage] avatarUrl  => $avatarUrl');
    debugPrint('📦 [Storage] isLogin    => $isLoginStatus');

    if (token != null && token.isNotEmpty && isLoginStatus == 'true') {
      user = UserModel(
        token: token,
        userId: userId ?? '',
        username: username ?? '',
        avatarUrl: avatarUrl ?? '',
      );
      isLogin = true;

      debugPrint('✅ [Session] User restored successfully');
      debugPrint('👤 [Session] Current user => $user');
    } else {
      user = UserModel();
      isLogin = false;

      debugPrint('⚠️ [Session] No valid session found');
    }
  }

  /// ================= LOGOUT =================
  Future<void> clearSession() async {
    debugPrint('🧹 [Session] Clearing session...');

    await _storage.clearValue('token');
    await _storage.clearValue('userId');
    await _storage.clearValue('username');
    await _storage.clearValue('avatarUrl');
    await _storage.setValue('isLogin', 'false');

    user = UserModel();
    isLogin = false;

    debugPrint('✅ [Session] Session cleared');
  }
}
