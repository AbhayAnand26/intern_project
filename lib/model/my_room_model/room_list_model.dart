import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_list_model.freezed.dart';
part 'room_list_model.g.dart';

/// ============================
/// ROOT RESPONSE
/// ============================
@freezed
abstract class RoomsResponseModel with _$RoomsResponseModel {
  const factory RoomsResponseModel({
    required bool success,
    @Default([]) List<Room> rooms,
  }) = _RoomsResponseModel;

  factory RoomsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RoomsResponseModelFromJson(json);
}

/// ============================
/// ROOM MODEL
/// ============================
@freezed
abstract class Room with _$Room {
  const factory Room({
    /// Mongo ID
    @JsonKey(name: '_id') required String id,

    required String roomId,

    required String creatorName,
    required String creatorAvatar,
    required String creatorEmail,

    required String title,
    required String mode,
    required String category,
    required String privacy,

    @Default('') String description,
    String? coverImage,

    required String host,

    /// Nested creator object
    required Creator creator,

    @Default([]) List<Participant> participants,

    int? maxParticipants,
    @Default([]) List<String> tags,

    required bool isActive,

    DateTime? endedAt,

    required RoomStats stats,

    required DateTime startedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}

/// ============================
/// CREATOR MODEL
/// ============================
@freezed
abstract class Creator with _$Creator {
  const factory Creator({
    @JsonKey(name: '_id') required String id,
    required String username,
    required String email,
  }) = _Creator;

  factory Creator.fromJson(Map<String, dynamic> json) =>
      _$CreatorFromJson(json);
}

/// ============================
/// PARTICIPANT MODEL
/// ============================
@freezed
abstract class Participant with _$Participant {
  const factory Participant({
    required String user,
    required String role,

    required bool isMuted,
    required bool isSpeaking,

    required String avatar,
    required DateTime joinedAt,

    @JsonKey(name: '_id') required String id,
  }) = _Participant;

  factory Participant.fromJson(Map<String, dynamic> json) =>
      _$ParticipantFromJson(json);
}

/// ============================
/// ROOM STATS MODEL
/// ============================
@freezed
abstract class RoomStats with _$RoomStats {
  const factory RoomStats({
    required int totalJoins,
    required int totalDuration,
    required int averageListeners,
  }) = _RoomStats;

  factory RoomStats.fromJson(Map<String, dynamic> json) =>
      _$RoomStatsFromJson(json);
}
