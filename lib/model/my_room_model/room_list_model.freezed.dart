// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoomsResponseModel {

 bool get success; List<Room> get rooms;
/// Create a copy of RoomsResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomsResponseModelCopyWith<RoomsResponseModel> get copyWith => _$RoomsResponseModelCopyWithImpl<RoomsResponseModel>(this as RoomsResponseModel, _$identity);

  /// Serializes this RoomsResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomsResponseModel&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other.rooms, rooms));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(rooms));

@override
String toString() {
  return 'RoomsResponseModel(success: $success, rooms: $rooms)';
}


}

/// @nodoc
abstract mixin class $RoomsResponseModelCopyWith<$Res>  {
  factory $RoomsResponseModelCopyWith(RoomsResponseModel value, $Res Function(RoomsResponseModel) _then) = _$RoomsResponseModelCopyWithImpl;
@useResult
$Res call({
 bool success, List<Room> rooms
});




}
/// @nodoc
class _$RoomsResponseModelCopyWithImpl<$Res>
    implements $RoomsResponseModelCopyWith<$Res> {
  _$RoomsResponseModelCopyWithImpl(this._self, this._then);

  final RoomsResponseModel _self;
  final $Res Function(RoomsResponseModel) _then;

/// Create a copy of RoomsResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? rooms = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,rooms: null == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as List<Room>,
  ));
}

}


/// Adds pattern-matching-related methods to [RoomsResponseModel].
extension RoomsResponseModelPatterns on RoomsResponseModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoomsResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoomsResponseModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoomsResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _RoomsResponseModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoomsResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _RoomsResponseModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  List<Room> rooms)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoomsResponseModel() when $default != null:
return $default(_that.success,_that.rooms);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  List<Room> rooms)  $default,) {final _that = this;
switch (_that) {
case _RoomsResponseModel():
return $default(_that.success,_that.rooms);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  List<Room> rooms)?  $default,) {final _that = this;
switch (_that) {
case _RoomsResponseModel() when $default != null:
return $default(_that.success,_that.rooms);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoomsResponseModel implements RoomsResponseModel {
  const _RoomsResponseModel({required this.success, final  List<Room> rooms = const []}): _rooms = rooms;
  factory _RoomsResponseModel.fromJson(Map<String, dynamic> json) => _$RoomsResponseModelFromJson(json);

@override final  bool success;
 final  List<Room> _rooms;
@override@JsonKey() List<Room> get rooms {
  if (_rooms is EqualUnmodifiableListView) return _rooms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rooms);
}


/// Create a copy of RoomsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomsResponseModelCopyWith<_RoomsResponseModel> get copyWith => __$RoomsResponseModelCopyWithImpl<_RoomsResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomsResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomsResponseModel&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other._rooms, _rooms));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(_rooms));

@override
String toString() {
  return 'RoomsResponseModel(success: $success, rooms: $rooms)';
}


}

/// @nodoc
abstract mixin class _$RoomsResponseModelCopyWith<$Res> implements $RoomsResponseModelCopyWith<$Res> {
  factory _$RoomsResponseModelCopyWith(_RoomsResponseModel value, $Res Function(_RoomsResponseModel) _then) = __$RoomsResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool success, List<Room> rooms
});




}
/// @nodoc
class __$RoomsResponseModelCopyWithImpl<$Res>
    implements _$RoomsResponseModelCopyWith<$Res> {
  __$RoomsResponseModelCopyWithImpl(this._self, this._then);

  final _RoomsResponseModel _self;
  final $Res Function(_RoomsResponseModel) _then;

/// Create a copy of RoomsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? rooms = null,}) {
  return _then(_RoomsResponseModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,rooms: null == rooms ? _self._rooms : rooms // ignore: cast_nullable_to_non_nullable
as List<Room>,
  ));
}


}


/// @nodoc
mixin _$Room {

/// Mongo ID
@JsonKey(name: '_id') String get id; String get roomId; String get creatorName; String get creatorAvatar; String get creatorEmail; String get title; String get mode; String get category; String get privacy; String get description; String? get coverImage; String get host;/// Nested creator object
 Creator get creator; List<Participant> get participants; int? get maxParticipants; List<String> get tags; bool get isActive; DateTime? get endedAt; RoomStats get stats; DateTime get startedAt; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomCopyWith<Room> get copyWith => _$RoomCopyWithImpl<Room>(this as Room, _$identity);

  /// Serializes this Room to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Room&&(identical(other.id, id) || other.id == id)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.creatorName, creatorName) || other.creatorName == creatorName)&&(identical(other.creatorAvatar, creatorAvatar) || other.creatorAvatar == creatorAvatar)&&(identical(other.creatorEmail, creatorEmail) || other.creatorEmail == creatorEmail)&&(identical(other.title, title) || other.title == title)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.category, category) || other.category == category)&&(identical(other.privacy, privacy) || other.privacy == privacy)&&(identical(other.description, description) || other.description == description)&&(identical(other.coverImage, coverImage) || other.coverImage == coverImage)&&(identical(other.host, host) || other.host == host)&&(identical(other.creator, creator) || other.creator == creator)&&const DeepCollectionEquality().equals(other.participants, participants)&&(identical(other.maxParticipants, maxParticipants) || other.maxParticipants == maxParticipants)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,roomId,creatorName,creatorAvatar,creatorEmail,title,mode,category,privacy,description,coverImage,host,creator,const DeepCollectionEquality().hash(participants),maxParticipants,const DeepCollectionEquality().hash(tags),isActive,endedAt,stats,startedAt,createdAt,updatedAt]);

@override
String toString() {
  return 'Room(id: $id, roomId: $roomId, creatorName: $creatorName, creatorAvatar: $creatorAvatar, creatorEmail: $creatorEmail, title: $title, mode: $mode, category: $category, privacy: $privacy, description: $description, coverImage: $coverImage, host: $host, creator: $creator, participants: $participants, maxParticipants: $maxParticipants, tags: $tags, isActive: $isActive, endedAt: $endedAt, stats: $stats, startedAt: $startedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $RoomCopyWith<$Res>  {
  factory $RoomCopyWith(Room value, $Res Function(Room) _then) = _$RoomCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String roomId, String creatorName, String creatorAvatar, String creatorEmail, String title, String mode, String category, String privacy, String description, String? coverImage, String host, Creator creator, List<Participant> participants, int? maxParticipants, List<String> tags, bool isActive, DateTime? endedAt, RoomStats stats, DateTime startedAt, DateTime createdAt, DateTime updatedAt
});


$CreatorCopyWith<$Res> get creator;$RoomStatsCopyWith<$Res> get stats;

}
/// @nodoc
class _$RoomCopyWithImpl<$Res>
    implements $RoomCopyWith<$Res> {
  _$RoomCopyWithImpl(this._self, this._then);

  final Room _self;
  final $Res Function(Room) _then;

/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? roomId = null,Object? creatorName = null,Object? creatorAvatar = null,Object? creatorEmail = null,Object? title = null,Object? mode = null,Object? category = null,Object? privacy = null,Object? description = null,Object? coverImage = freezed,Object? host = null,Object? creator = null,Object? participants = null,Object? maxParticipants = freezed,Object? tags = null,Object? isActive = null,Object? endedAt = freezed,Object? stats = null,Object? startedAt = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,creatorName: null == creatorName ? _self.creatorName : creatorName // ignore: cast_nullable_to_non_nullable
as String,creatorAvatar: null == creatorAvatar ? _self.creatorAvatar : creatorAvatar // ignore: cast_nullable_to_non_nullable
as String,creatorEmail: null == creatorEmail ? _self.creatorEmail : creatorEmail // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,privacy: null == privacy ? _self.privacy : privacy // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,coverImage: freezed == coverImage ? _self.coverImage : coverImage // ignore: cast_nullable_to_non_nullable
as String?,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,creator: null == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as Creator,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as List<Participant>,maxParticipants: freezed == maxParticipants ? _self.maxParticipants : maxParticipants // ignore: cast_nullable_to_non_nullable
as int?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as RoomStats,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatorCopyWith<$Res> get creator {
  
  return $CreatorCopyWith<$Res>(_self.creator, (value) {
    return _then(_self.copyWith(creator: value));
  });
}/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomStatsCopyWith<$Res> get stats {
  
  return $RoomStatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// Adds pattern-matching-related methods to [Room].
extension RoomPatterns on Room {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Room value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Room() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Room value)  $default,){
final _that = this;
switch (_that) {
case _Room():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Room value)?  $default,){
final _that = this;
switch (_that) {
case _Room() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String roomId,  String creatorName,  String creatorAvatar,  String creatorEmail,  String title,  String mode,  String category,  String privacy,  String description,  String? coverImage,  String host,  Creator creator,  List<Participant> participants,  int? maxParticipants,  List<String> tags,  bool isActive,  DateTime? endedAt,  RoomStats stats,  DateTime startedAt,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Room() when $default != null:
return $default(_that.id,_that.roomId,_that.creatorName,_that.creatorAvatar,_that.creatorEmail,_that.title,_that.mode,_that.category,_that.privacy,_that.description,_that.coverImage,_that.host,_that.creator,_that.participants,_that.maxParticipants,_that.tags,_that.isActive,_that.endedAt,_that.stats,_that.startedAt,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String roomId,  String creatorName,  String creatorAvatar,  String creatorEmail,  String title,  String mode,  String category,  String privacy,  String description,  String? coverImage,  String host,  Creator creator,  List<Participant> participants,  int? maxParticipants,  List<String> tags,  bool isActive,  DateTime? endedAt,  RoomStats stats,  DateTime startedAt,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Room():
return $default(_that.id,_that.roomId,_that.creatorName,_that.creatorAvatar,_that.creatorEmail,_that.title,_that.mode,_that.category,_that.privacy,_that.description,_that.coverImage,_that.host,_that.creator,_that.participants,_that.maxParticipants,_that.tags,_that.isActive,_that.endedAt,_that.stats,_that.startedAt,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  String roomId,  String creatorName,  String creatorAvatar,  String creatorEmail,  String title,  String mode,  String category,  String privacy,  String description,  String? coverImage,  String host,  Creator creator,  List<Participant> participants,  int? maxParticipants,  List<String> tags,  bool isActive,  DateTime? endedAt,  RoomStats stats,  DateTime startedAt,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Room() when $default != null:
return $default(_that.id,_that.roomId,_that.creatorName,_that.creatorAvatar,_that.creatorEmail,_that.title,_that.mode,_that.category,_that.privacy,_that.description,_that.coverImage,_that.host,_that.creator,_that.participants,_that.maxParticipants,_that.tags,_that.isActive,_that.endedAt,_that.stats,_that.startedAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Room implements Room {
  const _Room({@JsonKey(name: '_id') required this.id, required this.roomId, required this.creatorName, required this.creatorAvatar, required this.creatorEmail, required this.title, required this.mode, required this.category, required this.privacy, this.description = '', this.coverImage, required this.host, required this.creator, final  List<Participant> participants = const [], this.maxParticipants, final  List<String> tags = const [], required this.isActive, this.endedAt, required this.stats, required this.startedAt, required this.createdAt, required this.updatedAt}): _participants = participants,_tags = tags;
  factory _Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

/// Mongo ID
@override@JsonKey(name: '_id') final  String id;
@override final  String roomId;
@override final  String creatorName;
@override final  String creatorAvatar;
@override final  String creatorEmail;
@override final  String title;
@override final  String mode;
@override final  String category;
@override final  String privacy;
@override@JsonKey() final  String description;
@override final  String? coverImage;
@override final  String host;
/// Nested creator object
@override final  Creator creator;
 final  List<Participant> _participants;
@override@JsonKey() List<Participant> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}

@override final  int? maxParticipants;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  bool isActive;
@override final  DateTime? endedAt;
@override final  RoomStats stats;
@override final  DateTime startedAt;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomCopyWith<_Room> get copyWith => __$RoomCopyWithImpl<_Room>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Room&&(identical(other.id, id) || other.id == id)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.creatorName, creatorName) || other.creatorName == creatorName)&&(identical(other.creatorAvatar, creatorAvatar) || other.creatorAvatar == creatorAvatar)&&(identical(other.creatorEmail, creatorEmail) || other.creatorEmail == creatorEmail)&&(identical(other.title, title) || other.title == title)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.category, category) || other.category == category)&&(identical(other.privacy, privacy) || other.privacy == privacy)&&(identical(other.description, description) || other.description == description)&&(identical(other.coverImage, coverImage) || other.coverImage == coverImage)&&(identical(other.host, host) || other.host == host)&&(identical(other.creator, creator) || other.creator == creator)&&const DeepCollectionEquality().equals(other._participants, _participants)&&(identical(other.maxParticipants, maxParticipants) || other.maxParticipants == maxParticipants)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,roomId,creatorName,creatorAvatar,creatorEmail,title,mode,category,privacy,description,coverImage,host,creator,const DeepCollectionEquality().hash(_participants),maxParticipants,const DeepCollectionEquality().hash(_tags),isActive,endedAt,stats,startedAt,createdAt,updatedAt]);

@override
String toString() {
  return 'Room(id: $id, roomId: $roomId, creatorName: $creatorName, creatorAvatar: $creatorAvatar, creatorEmail: $creatorEmail, title: $title, mode: $mode, category: $category, privacy: $privacy, description: $description, coverImage: $coverImage, host: $host, creator: $creator, participants: $participants, maxParticipants: $maxParticipants, tags: $tags, isActive: $isActive, endedAt: $endedAt, stats: $stats, startedAt: $startedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$RoomCopyWith<$Res> implements $RoomCopyWith<$Res> {
  factory _$RoomCopyWith(_Room value, $Res Function(_Room) _then) = __$RoomCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String roomId, String creatorName, String creatorAvatar, String creatorEmail, String title, String mode, String category, String privacy, String description, String? coverImage, String host, Creator creator, List<Participant> participants, int? maxParticipants, List<String> tags, bool isActive, DateTime? endedAt, RoomStats stats, DateTime startedAt, DateTime createdAt, DateTime updatedAt
});


@override $CreatorCopyWith<$Res> get creator;@override $RoomStatsCopyWith<$Res> get stats;

}
/// @nodoc
class __$RoomCopyWithImpl<$Res>
    implements _$RoomCopyWith<$Res> {
  __$RoomCopyWithImpl(this._self, this._then);

  final _Room _self;
  final $Res Function(_Room) _then;

/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? roomId = null,Object? creatorName = null,Object? creatorAvatar = null,Object? creatorEmail = null,Object? title = null,Object? mode = null,Object? category = null,Object? privacy = null,Object? description = null,Object? coverImage = freezed,Object? host = null,Object? creator = null,Object? participants = null,Object? maxParticipants = freezed,Object? tags = null,Object? isActive = null,Object? endedAt = freezed,Object? stats = null,Object? startedAt = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Room(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,creatorName: null == creatorName ? _self.creatorName : creatorName // ignore: cast_nullable_to_non_nullable
as String,creatorAvatar: null == creatorAvatar ? _self.creatorAvatar : creatorAvatar // ignore: cast_nullable_to_non_nullable
as String,creatorEmail: null == creatorEmail ? _self.creatorEmail : creatorEmail // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,privacy: null == privacy ? _self.privacy : privacy // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,coverImage: freezed == coverImage ? _self.coverImage : coverImage // ignore: cast_nullable_to_non_nullable
as String?,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,creator: null == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as Creator,participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<Participant>,maxParticipants: freezed == maxParticipants ? _self.maxParticipants : maxParticipants // ignore: cast_nullable_to_non_nullable
as int?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as RoomStats,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatorCopyWith<$Res> get creator {
  
  return $CreatorCopyWith<$Res>(_self.creator, (value) {
    return _then(_self.copyWith(creator: value));
  });
}/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomStatsCopyWith<$Res> get stats {
  
  return $RoomStatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// @nodoc
mixin _$Creator {

@JsonKey(name: '_id') String get id; String get username; String get email;
/// Create a copy of Creator
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatorCopyWith<Creator> get copyWith => _$CreatorCopyWithImpl<Creator>(this as Creator, _$identity);

  /// Serializes this Creator to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Creator&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,email);

@override
String toString() {
  return 'Creator(id: $id, username: $username, email: $email)';
}


}

/// @nodoc
abstract mixin class $CreatorCopyWith<$Res>  {
  factory $CreatorCopyWith(Creator value, $Res Function(Creator) _then) = _$CreatorCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String username, String email
});




}
/// @nodoc
class _$CreatorCopyWithImpl<$Res>
    implements $CreatorCopyWith<$Res> {
  _$CreatorCopyWithImpl(this._self, this._then);

  final Creator _self;
  final $Res Function(Creator) _then;

/// Create a copy of Creator
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? email = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Creator].
extension CreatorPatterns on Creator {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Creator value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Creator() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Creator value)  $default,){
final _that = this;
switch (_that) {
case _Creator():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Creator value)?  $default,){
final _that = this;
switch (_that) {
case _Creator() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String username,  String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Creator() when $default != null:
return $default(_that.id,_that.username,_that.email);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String username,  String email)  $default,) {final _that = this;
switch (_that) {
case _Creator():
return $default(_that.id,_that.username,_that.email);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  String username,  String email)?  $default,) {final _that = this;
switch (_that) {
case _Creator() when $default != null:
return $default(_that.id,_that.username,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Creator implements Creator {
  const _Creator({@JsonKey(name: '_id') required this.id, required this.username, required this.email});
  factory _Creator.fromJson(Map<String, dynamic> json) => _$CreatorFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String username;
@override final  String email;

/// Create a copy of Creator
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatorCopyWith<_Creator> get copyWith => __$CreatorCopyWithImpl<_Creator>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Creator&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,email);

@override
String toString() {
  return 'Creator(id: $id, username: $username, email: $email)';
}


}

/// @nodoc
abstract mixin class _$CreatorCopyWith<$Res> implements $CreatorCopyWith<$Res> {
  factory _$CreatorCopyWith(_Creator value, $Res Function(_Creator) _then) = __$CreatorCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String username, String email
});




}
/// @nodoc
class __$CreatorCopyWithImpl<$Res>
    implements _$CreatorCopyWith<$Res> {
  __$CreatorCopyWithImpl(this._self, this._then);

  final _Creator _self;
  final $Res Function(_Creator) _then;

/// Create a copy of Creator
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? email = null,}) {
  return _then(_Creator(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Participant {

 String get user; String get role; bool get isMuted; bool get isSpeaking; String get avatar; DateTime get joinedAt;@JsonKey(name: '_id') String get id;
/// Create a copy of Participant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParticipantCopyWith<Participant> get copyWith => _$ParticipantCopyWithImpl<Participant>(this as Participant, _$identity);

  /// Serializes this Participant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Participant&&(identical(other.user, user) || other.user == user)&&(identical(other.role, role) || other.role == role)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted)&&(identical(other.isSpeaking, isSpeaking) || other.isSpeaking == isSpeaking)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,role,isMuted,isSpeaking,avatar,joinedAt,id);

@override
String toString() {
  return 'Participant(user: $user, role: $role, isMuted: $isMuted, isSpeaking: $isSpeaking, avatar: $avatar, joinedAt: $joinedAt, id: $id)';
}


}

/// @nodoc
abstract mixin class $ParticipantCopyWith<$Res>  {
  factory $ParticipantCopyWith(Participant value, $Res Function(Participant) _then) = _$ParticipantCopyWithImpl;
@useResult
$Res call({
 String user, String role, bool isMuted, bool isSpeaking, String avatar, DateTime joinedAt,@JsonKey(name: '_id') String id
});




}
/// @nodoc
class _$ParticipantCopyWithImpl<$Res>
    implements $ParticipantCopyWith<$Res> {
  _$ParticipantCopyWithImpl(this._self, this._then);

  final Participant _self;
  final $Res Function(Participant) _then;

/// Create a copy of Participant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? role = null,Object? isMuted = null,Object? isSpeaking = null,Object? avatar = null,Object? joinedAt = null,Object? id = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,isMuted: null == isMuted ? _self.isMuted : isMuted // ignore: cast_nullable_to_non_nullable
as bool,isSpeaking: null == isSpeaking ? _self.isSpeaking : isSpeaking // ignore: cast_nullable_to_non_nullable
as bool,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Participant].
extension ParticipantPatterns on Participant {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Participant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Participant() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Participant value)  $default,){
final _that = this;
switch (_that) {
case _Participant():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Participant value)?  $default,){
final _that = this;
switch (_that) {
case _Participant() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String user,  String role,  bool isMuted,  bool isSpeaking,  String avatar,  DateTime joinedAt, @JsonKey(name: '_id')  String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Participant() when $default != null:
return $default(_that.user,_that.role,_that.isMuted,_that.isSpeaking,_that.avatar,_that.joinedAt,_that.id);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String user,  String role,  bool isMuted,  bool isSpeaking,  String avatar,  DateTime joinedAt, @JsonKey(name: '_id')  String id)  $default,) {final _that = this;
switch (_that) {
case _Participant():
return $default(_that.user,_that.role,_that.isMuted,_that.isSpeaking,_that.avatar,_that.joinedAt,_that.id);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String user,  String role,  bool isMuted,  bool isSpeaking,  String avatar,  DateTime joinedAt, @JsonKey(name: '_id')  String id)?  $default,) {final _that = this;
switch (_that) {
case _Participant() when $default != null:
return $default(_that.user,_that.role,_that.isMuted,_that.isSpeaking,_that.avatar,_that.joinedAt,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Participant implements Participant {
  const _Participant({required this.user, required this.role, required this.isMuted, required this.isSpeaking, required this.avatar, required this.joinedAt, @JsonKey(name: '_id') required this.id});
  factory _Participant.fromJson(Map<String, dynamic> json) => _$ParticipantFromJson(json);

@override final  String user;
@override final  String role;
@override final  bool isMuted;
@override final  bool isSpeaking;
@override final  String avatar;
@override final  DateTime joinedAt;
@override@JsonKey(name: '_id') final  String id;

/// Create a copy of Participant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParticipantCopyWith<_Participant> get copyWith => __$ParticipantCopyWithImpl<_Participant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParticipantToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Participant&&(identical(other.user, user) || other.user == user)&&(identical(other.role, role) || other.role == role)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted)&&(identical(other.isSpeaking, isSpeaking) || other.isSpeaking == isSpeaking)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,role,isMuted,isSpeaking,avatar,joinedAt,id);

@override
String toString() {
  return 'Participant(user: $user, role: $role, isMuted: $isMuted, isSpeaking: $isSpeaking, avatar: $avatar, joinedAt: $joinedAt, id: $id)';
}


}

/// @nodoc
abstract mixin class _$ParticipantCopyWith<$Res> implements $ParticipantCopyWith<$Res> {
  factory _$ParticipantCopyWith(_Participant value, $Res Function(_Participant) _then) = __$ParticipantCopyWithImpl;
@override @useResult
$Res call({
 String user, String role, bool isMuted, bool isSpeaking, String avatar, DateTime joinedAt,@JsonKey(name: '_id') String id
});




}
/// @nodoc
class __$ParticipantCopyWithImpl<$Res>
    implements _$ParticipantCopyWith<$Res> {
  __$ParticipantCopyWithImpl(this._self, this._then);

  final _Participant _self;
  final $Res Function(_Participant) _then;

/// Create a copy of Participant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? role = null,Object? isMuted = null,Object? isSpeaking = null,Object? avatar = null,Object? joinedAt = null,Object? id = null,}) {
  return _then(_Participant(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,isMuted: null == isMuted ? _self.isMuted : isMuted // ignore: cast_nullable_to_non_nullable
as bool,isSpeaking: null == isSpeaking ? _self.isSpeaking : isSpeaking // ignore: cast_nullable_to_non_nullable
as bool,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RoomStats {

 int get totalJoins; int get totalDuration; int get averageListeners;
/// Create a copy of RoomStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomStatsCopyWith<RoomStats> get copyWith => _$RoomStatsCopyWithImpl<RoomStats>(this as RoomStats, _$identity);

  /// Serializes this RoomStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomStats&&(identical(other.totalJoins, totalJoins) || other.totalJoins == totalJoins)&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.averageListeners, averageListeners) || other.averageListeners == averageListeners));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalJoins,totalDuration,averageListeners);

@override
String toString() {
  return 'RoomStats(totalJoins: $totalJoins, totalDuration: $totalDuration, averageListeners: $averageListeners)';
}


}

/// @nodoc
abstract mixin class $RoomStatsCopyWith<$Res>  {
  factory $RoomStatsCopyWith(RoomStats value, $Res Function(RoomStats) _then) = _$RoomStatsCopyWithImpl;
@useResult
$Res call({
 int totalJoins, int totalDuration, int averageListeners
});




}
/// @nodoc
class _$RoomStatsCopyWithImpl<$Res>
    implements $RoomStatsCopyWith<$Res> {
  _$RoomStatsCopyWithImpl(this._self, this._then);

  final RoomStats _self;
  final $Res Function(RoomStats) _then;

/// Create a copy of RoomStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalJoins = null,Object? totalDuration = null,Object? averageListeners = null,}) {
  return _then(_self.copyWith(
totalJoins: null == totalJoins ? _self.totalJoins : totalJoins // ignore: cast_nullable_to_non_nullable
as int,totalDuration: null == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as int,averageListeners: null == averageListeners ? _self.averageListeners : averageListeners // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RoomStats].
extension RoomStatsPatterns on RoomStats {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoomStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoomStats() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoomStats value)  $default,){
final _that = this;
switch (_that) {
case _RoomStats():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoomStats value)?  $default,){
final _that = this;
switch (_that) {
case _RoomStats() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalJoins,  int totalDuration,  int averageListeners)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoomStats() when $default != null:
return $default(_that.totalJoins,_that.totalDuration,_that.averageListeners);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalJoins,  int totalDuration,  int averageListeners)  $default,) {final _that = this;
switch (_that) {
case _RoomStats():
return $default(_that.totalJoins,_that.totalDuration,_that.averageListeners);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalJoins,  int totalDuration,  int averageListeners)?  $default,) {final _that = this;
switch (_that) {
case _RoomStats() when $default != null:
return $default(_that.totalJoins,_that.totalDuration,_that.averageListeners);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoomStats implements RoomStats {
  const _RoomStats({required this.totalJoins, required this.totalDuration, required this.averageListeners});
  factory _RoomStats.fromJson(Map<String, dynamic> json) => _$RoomStatsFromJson(json);

@override final  int totalJoins;
@override final  int totalDuration;
@override final  int averageListeners;

/// Create a copy of RoomStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomStatsCopyWith<_RoomStats> get copyWith => __$RoomStatsCopyWithImpl<_RoomStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomStats&&(identical(other.totalJoins, totalJoins) || other.totalJoins == totalJoins)&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.averageListeners, averageListeners) || other.averageListeners == averageListeners));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalJoins,totalDuration,averageListeners);

@override
String toString() {
  return 'RoomStats(totalJoins: $totalJoins, totalDuration: $totalDuration, averageListeners: $averageListeners)';
}


}

/// @nodoc
abstract mixin class _$RoomStatsCopyWith<$Res> implements $RoomStatsCopyWith<$Res> {
  factory _$RoomStatsCopyWith(_RoomStats value, $Res Function(_RoomStats) _then) = __$RoomStatsCopyWithImpl;
@override @useResult
$Res call({
 int totalJoins, int totalDuration, int averageListeners
});




}
/// @nodoc
class __$RoomStatsCopyWithImpl<$Res>
    implements _$RoomStatsCopyWith<$Res> {
  __$RoomStatsCopyWithImpl(this._self, this._then);

  final _RoomStats _self;
  final $Res Function(_RoomStats) _then;

/// Create a copy of RoomStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalJoins = null,Object? totalDuration = null,Object? averageListeners = null,}) {
  return _then(_RoomStats(
totalJoins: null == totalJoins ? _self.totalJoins : totalJoins // ignore: cast_nullable_to_non_nullable
as int,totalDuration: null == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as int,averageListeners: null == averageListeners ? _self.averageListeners : averageListeners // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
