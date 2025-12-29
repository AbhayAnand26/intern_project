// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoomsResponseModel _$RoomsResponseModelFromJson(Map<String, dynamic> json) =>
    _RoomsResponseModel(
      success: json['success'] as bool,
      rooms:
          (json['rooms'] as List<dynamic>?)
              ?.map((e) => Room.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RoomsResponseModelToJson(_RoomsResponseModel instance) =>
    <String, dynamic>{'success': instance.success, 'rooms': instance.rooms};

_Room _$RoomFromJson(Map<String, dynamic> json) => _Room(
  id: json['_id'] as String,
  roomId: json['roomId'] as String,
  creatorName: json['creatorName'] as String,
  creatorAvatar: json['creatorAvatar'] as String,
  creatorEmail: json['creatorEmail'] as String,
  title: json['title'] as String,
  mode: json['mode'] as String,
  category: json['category'] as String,
  privacy: json['privacy'] as String,
  description: json['description'] as String? ?? '',
  coverImage: json['coverImage'] as String?,
  host: json['host'] as String,
  creator: Creator.fromJson(json['creator'] as Map<String, dynamic>),
  participants:
      (json['participants'] as List<dynamic>?)
          ?.map((e) => Participant.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  maxParticipants: (json['maxParticipants'] as num?)?.toInt(),
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  isActive: json['isActive'] as bool,
  endedAt: json['endedAt'] == null
      ? null
      : DateTime.parse(json['endedAt'] as String),
  stats: RoomStats.fromJson(json['stats'] as Map<String, dynamic>),
  startedAt: DateTime.parse(json['startedAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$RoomToJson(_Room instance) => <String, dynamic>{
  '_id': instance.id,
  'roomId': instance.roomId,
  'creatorName': instance.creatorName,
  'creatorAvatar': instance.creatorAvatar,
  'creatorEmail': instance.creatorEmail,
  'title': instance.title,
  'mode': instance.mode,
  'category': instance.category,
  'privacy': instance.privacy,
  'description': instance.description,
  'coverImage': instance.coverImage,
  'host': instance.host,
  'creator': instance.creator,
  'participants': instance.participants,
  'maxParticipants': instance.maxParticipants,
  'tags': instance.tags,
  'isActive': instance.isActive,
  'endedAt': instance.endedAt?.toIso8601String(),
  'stats': instance.stats,
  'startedAt': instance.startedAt.toIso8601String(),
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

_Creator _$CreatorFromJson(Map<String, dynamic> json) => _Creator(
  id: json['_id'] as String,
  username: json['username'] as String,
  email: json['email'] as String,
);

Map<String, dynamic> _$CreatorToJson(_Creator instance) => <String, dynamic>{
  '_id': instance.id,
  'username': instance.username,
  'email': instance.email,
};

_Participant _$ParticipantFromJson(Map<String, dynamic> json) => _Participant(
  user: json['user'] as String,
  role: json['role'] as String,
  isMuted: json['isMuted'] as bool,
  isSpeaking: json['isSpeaking'] as bool,
  avatar: json['avatar'] as String,
  joinedAt: DateTime.parse(json['joinedAt'] as String),
  id: json['_id'] as String,
);

Map<String, dynamic> _$ParticipantToJson(_Participant instance) =>
    <String, dynamic>{
      'user': instance.user,
      'role': instance.role,
      'isMuted': instance.isMuted,
      'isSpeaking': instance.isSpeaking,
      'avatar': instance.avatar,
      'joinedAt': instance.joinedAt.toIso8601String(),
      '_id': instance.id,
    };

_RoomStats _$RoomStatsFromJson(Map<String, dynamic> json) => _RoomStats(
  totalJoins: (json['totalJoins'] as num).toInt(),
  totalDuration: (json['totalDuration'] as num).toInt(),
  averageListeners: (json['averageListeners'] as num).toInt(),
);

Map<String, dynamic> _$RoomStatsToJson(_RoomStats instance) =>
    <String, dynamic>{
      'totalJoins': instance.totalJoins,
      'totalDuration': instance.totalDuration,
      'averageListeners': instance.averageListeners,
    };
