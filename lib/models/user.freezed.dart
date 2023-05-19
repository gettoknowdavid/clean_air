// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  bool get verified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String uid, String name, String email, String? avatar, bool verified});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? email = null,
    Object? avatar = freezed,
    Object? verified = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid, String name, String email, String? avatar, bool verified});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? email = null,
    Object? avatar = freezed,
    Object? verified = null,
  }) {
    return _then(_$_User(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User(
      {required this.uid,
      required this.name,
      required this.email,
      this.avatar,
      required this.verified});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String uid;
  @override
  final String name;
  @override
  final String email;
  @override
  final String? avatar;
  @override
  final bool verified;

  @override
  String toString() {
    return 'User(uid: $uid, name: $name, email: $email, avatar: $avatar, verified: $verified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.verified, verified) ||
                other.verified == verified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, name, email, avatar, verified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final String uid,
      required final String name,
      required final String email,
      final String? avatar,
      required final bool verified}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get uid;
  @override
  String get name;
  @override
  String get email;
  @override
  String? get avatar;
  @override
  bool get verified;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}

Favourite _$FavouriteFromJson(Map<String, dynamic> json) {
  return _Favourite.fromJson(json);
}

/// @nodoc
mixin _$Favourite {
  dynamic get uid => throw _privateConstructorUsedError;
  dynamic get aqi => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<double>? get geo => throw _privateConstructorUsedError;
  @FirestoreTimestampConverter()
  DateTime? get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavouriteCopyWith<Favourite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteCopyWith<$Res> {
  factory $FavouriteCopyWith(Favourite value, $Res Function(Favourite) then) =
      _$FavouriteCopyWithImpl<$Res, Favourite>;
  @useResult
  $Res call(
      {dynamic uid,
      dynamic aqi,
      String? name,
      List<double>? geo,
      @FirestoreTimestampConverter() DateTime? time});
}

/// @nodoc
class _$FavouriteCopyWithImpl<$Res, $Val extends Favourite>
    implements $FavouriteCopyWith<$Res> {
  _$FavouriteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? aqi = freezed,
    Object? name = freezed,
    Object? geo = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as dynamic,
      aqi: freezed == aqi
          ? _value.aqi
          : aqi // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      geo: freezed == geo
          ? _value.geo
          : geo // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavouriteCopyWith<$Res> implements $FavouriteCopyWith<$Res> {
  factory _$$_FavouriteCopyWith(
          _$_Favourite value, $Res Function(_$_Favourite) then) =
      __$$_FavouriteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic uid,
      dynamic aqi,
      String? name,
      List<double>? geo,
      @FirestoreTimestampConverter() DateTime? time});
}

/// @nodoc
class __$$_FavouriteCopyWithImpl<$Res>
    extends _$FavouriteCopyWithImpl<$Res, _$_Favourite>
    implements _$$_FavouriteCopyWith<$Res> {
  __$$_FavouriteCopyWithImpl(
      _$_Favourite _value, $Res Function(_$_Favourite) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? aqi = freezed,
    Object? name = freezed,
    Object? geo = freezed,
    Object? time = freezed,
  }) {
    return _then(_$_Favourite(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as dynamic,
      aqi: freezed == aqi
          ? _value.aqi
          : aqi // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      geo: freezed == geo
          ? _value._geo
          : geo // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Favourite implements _Favourite {
  _$_Favourite(
      {required this.uid,
      this.aqi,
      this.name,
      final List<double>? geo,
      @FirestoreTimestampConverter() this.time})
      : _geo = geo;

  factory _$_Favourite.fromJson(Map<String, dynamic> json) =>
      _$$_FavouriteFromJson(json);

  @override
  final dynamic uid;
  @override
  final dynamic aqi;
  @override
  final String? name;
  final List<double>? _geo;
  @override
  List<double>? get geo {
    final value = _geo;
    if (value == null) return null;
    if (_geo is EqualUnmodifiableListView) return _geo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @FirestoreTimestampConverter()
  final DateTime? time;

  @override
  String toString() {
    return 'Favourite(uid: $uid, aqi: $aqi, name: $name, geo: $geo, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Favourite &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.aqi, aqi) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._geo, _geo) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(aqi),
      name,
      const DeepCollectionEquality().hash(_geo),
      time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavouriteCopyWith<_$_Favourite> get copyWith =>
      __$$_FavouriteCopyWithImpl<_$_Favourite>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavouriteToJson(
      this,
    );
  }
}

abstract class _Favourite implements Favourite {
  factory _Favourite(
      {required final dynamic uid,
      final dynamic aqi,
      final String? name,
      final List<double>? geo,
      @FirestoreTimestampConverter() final DateTime? time}) = _$_Favourite;

  factory _Favourite.fromJson(Map<String, dynamic> json) =
      _$_Favourite.fromJson;

  @override
  dynamic get uid;
  @override
  dynamic get aqi;
  @override
  String? get name;
  @override
  List<double>? get geo;
  @override
  @FirestoreTimestampConverter()
  DateTime? get time;
  @override
  @JsonKey(ignore: true)
  _$$_FavouriteCopyWith<_$_Favourite> get copyWith =>
      throw _privateConstructorUsedError;
}
