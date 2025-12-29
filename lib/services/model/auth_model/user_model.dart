// user_model.dart
class UserModel {
  final String userId;
  final String username;
  final String avatarUrl;
  final String token;

  UserModel({
    this.userId = '',
    this.username = '',
    this.avatarUrl = '',
    this.token = '',
  });

  UserModel copyWith({
    String? userId,
    String? username,
    String? avatarUrl,
    String? token,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      token: token ?? this.token,
    );
  }
}
