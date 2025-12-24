// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get uid => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;
  String get role =>
      throw _privateConstructorUsedError; // user, admin, moderator
  List<String> get favoriteTemples => throw _privateConstructorUsedError;
  List<String> get favoriteGranths => throw _privateConstructorUsedError;
  bool get emailVerified => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get lastLoginAt => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String uid,
      String email,
      String displayName,
      String phoneNumber,
      String photoUrl,
      String role,
      List<String> favoriteTemples,
      List<String> favoriteGranths,
      bool emailVerified,
      bool isActive,
      DateTime? createdAt,
      DateTime? lastLoginAt});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? displayName = null,
    Object? phoneNumber = null,
    Object? photoUrl = null,
    Object? role = null,
    Object? favoriteTemples = null,
    Object? favoriteGranths = null,
    Object? emailVerified = null,
    Object? isActive = null,
    Object? createdAt = freezed,
    Object? lastLoginAt = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteTemples: null == favoriteTemples
          ? _value.favoriteTemples
          : favoriteTemples // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoriteGranths: null == favoriteGranths
          ? _value.favoriteGranths
          : favoriteGranths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String email,
      String displayName,
      String phoneNumber,
      String photoUrl,
      String role,
      List<String> favoriteTemples,
      List<String> favoriteGranths,
      bool emailVerified,
      bool isActive,
      DateTime? createdAt,
      DateTime? lastLoginAt});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? displayName = null,
    Object? phoneNumber = null,
    Object? photoUrl = null,
    Object? role = null,
    Object? favoriteTemples = null,
    Object? favoriteGranths = null,
    Object? emailVerified = null,
    Object? isActive = null,
    Object? createdAt = freezed,
    Object? lastLoginAt = freezed,
  }) {
    return _then(_$UserImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteTemples: null == favoriteTemples
          ? _value._favoriteTemples
          : favoriteTemples // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoriteGranths: null == favoriteGranths
          ? _value._favoriteGranths
          : favoriteGranths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.uid,
      required this.email,
      this.displayName = '',
      this.phoneNumber = '',
      this.photoUrl = '',
      this.role = 'user',
      final List<String> favoriteTemples = const [],
      final List<String> favoriteGranths = const [],
      this.emailVerified = false,
      this.isActive = true,
      this.createdAt,
      this.lastLoginAt})
      : _favoriteTemples = favoriteTemples,
        _favoriteGranths = favoriteGranths;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String uid;
  @override
  final String email;
  @override
  @JsonKey()
  final String displayName;
  @override
  @JsonKey()
  final String phoneNumber;
  @override
  @JsonKey()
  final String photoUrl;
  @override
  @JsonKey()
  final String role;
// user, admin, moderator
  final List<String> _favoriteTemples;
// user, admin, moderator
  @override
  @JsonKey()
  List<String> get favoriteTemples {
    if (_favoriteTemples is EqualUnmodifiableListView) return _favoriteTemples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteTemples);
  }

  final List<String> _favoriteGranths;
  @override
  @JsonKey()
  List<String> get favoriteGranths {
    if (_favoriteGranths is EqualUnmodifiableListView) return _favoriteGranths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteGranths);
  }

  @override
  @JsonKey()
  final bool emailVerified;
  @override
  @JsonKey()
  final bool isActive;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? lastLoginAt;

  @override
  String toString() {
    return 'User(uid: $uid, email: $email, displayName: $displayName, phoneNumber: $phoneNumber, photoUrl: $photoUrl, role: $role, favoriteTemples: $favoriteTemples, favoriteGranths: $favoriteGranths, emailVerified: $emailVerified, isActive: $isActive, createdAt: $createdAt, lastLoginAt: $lastLoginAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality()
                .equals(other._favoriteTemples, _favoriteTemples) &&
            const DeepCollectionEquality()
                .equals(other._favoriteGranths, _favoriteGranths) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastLoginAt, lastLoginAt) ||
                other.lastLoginAt == lastLoginAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      email,
      displayName,
      phoneNumber,
      photoUrl,
      role,
      const DeepCollectionEquality().hash(_favoriteTemples),
      const DeepCollectionEquality().hash(_favoriteGranths),
      emailVerified,
      isActive,
      createdAt,
      lastLoginAt);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final String uid,
      required final String email,
      final String displayName,
      final String phoneNumber,
      final String photoUrl,
      final String role,
      final List<String> favoriteTemples,
      final List<String> favoriteGranths,
      final bool emailVerified,
      final bool isActive,
      final DateTime? createdAt,
      final DateTime? lastLoginAt}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get uid;
  @override
  String get email;
  @override
  String get displayName;
  @override
  String get phoneNumber;
  @override
  String get photoUrl;
  @override
  String get role; // user, admin, moderator
  @override
  List<String> get favoriteTemples;
  @override
  List<String> get favoriteGranths;
  @override
  bool get emailVerified;
  @override
  bool get isActive;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get lastLoginAt;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
