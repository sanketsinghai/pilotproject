// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dharamshala_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Dharamshala _$DharamshalaFromJson(Map<String, dynamic> json) {
  return _Dharamshala.fromJson(json);
}

/// @nodoc
mixin _$Dharamshala {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get totalRooms => throw _privateConstructorUsedError;
  int get availableRooms => throw _privateConstructorUsedError;
  double get costPerNight => throw _privateConstructorUsedError;
  List<String> get amenities => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get contactPerson => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get reviewCount => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Dharamshala to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Dharamshala
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DharamshalaCopyWith<Dharamshala> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DharamshalaCopyWith<$Res> {
  factory $DharamshalaCopyWith(
          Dharamshala value, $Res Function(Dharamshala) then) =
      _$DharamshalaCopyWithImpl<$Res, Dharamshala>;
  @useResult
  $Res call(
      {String id,
      String name,
      String state,
      String city,
      String address,
      double latitude,
      double longitude,
      String description,
      int totalRooms,
      int availableRooms,
      double costPerNight,
      List<String> amenities,
      String phoneNumber,
      String email,
      String contactPerson,
      double rating,
      int reviewCount,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$DharamshalaCopyWithImpl<$Res, $Val extends Dharamshala>
    implements $DharamshalaCopyWith<$Res> {
  _$DharamshalaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Dharamshala
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? state = null,
    Object? city = null,
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? description = null,
    Object? totalRooms = null,
    Object? availableRooms = null,
    Object? costPerNight = null,
    Object? amenities = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? contactPerson = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      totalRooms: null == totalRooms
          ? _value.totalRooms
          : totalRooms // ignore: cast_nullable_to_non_nullable
              as int,
      availableRooms: null == availableRooms
          ? _value.availableRooms
          : availableRooms // ignore: cast_nullable_to_non_nullable
              as int,
      costPerNight: null == costPerNight
          ? _value.costPerNight
          : costPerNight // ignore: cast_nullable_to_non_nullable
              as double,
      amenities: null == amenities
          ? _value.amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      contactPerson: null == contactPerson
          ? _value.contactPerson
          : contactPerson // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DharamshalaImplCopyWith<$Res>
    implements $DharamshalaCopyWith<$Res> {
  factory _$$DharamshalaImplCopyWith(
          _$DharamshalaImpl value, $Res Function(_$DharamshalaImpl) then) =
      __$$DharamshalaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String state,
      String city,
      String address,
      double latitude,
      double longitude,
      String description,
      int totalRooms,
      int availableRooms,
      double costPerNight,
      List<String> amenities,
      String phoneNumber,
      String email,
      String contactPerson,
      double rating,
      int reviewCount,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$DharamshalaImplCopyWithImpl<$Res>
    extends _$DharamshalaCopyWithImpl<$Res, _$DharamshalaImpl>
    implements _$$DharamshalaImplCopyWith<$Res> {
  __$$DharamshalaImplCopyWithImpl(
      _$DharamshalaImpl _value, $Res Function(_$DharamshalaImpl) _then)
      : super(_value, _then);

  /// Create a copy of Dharamshala
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? state = null,
    Object? city = null,
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? description = null,
    Object? totalRooms = null,
    Object? availableRooms = null,
    Object? costPerNight = null,
    Object? amenities = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? contactPerson = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$DharamshalaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      totalRooms: null == totalRooms
          ? _value.totalRooms
          : totalRooms // ignore: cast_nullable_to_non_nullable
              as int,
      availableRooms: null == availableRooms
          ? _value.availableRooms
          : availableRooms // ignore: cast_nullable_to_non_nullable
              as int,
      costPerNight: null == costPerNight
          ? _value.costPerNight
          : costPerNight // ignore: cast_nullable_to_non_nullable
              as double,
      amenities: null == amenities
          ? _value._amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      contactPerson: null == contactPerson
          ? _value.contactPerson
          : contactPerson // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DharamshalaImpl implements _Dharamshala {
  const _$DharamshalaImpl(
      {required this.id,
      required this.name,
      required this.state,
      required this.city,
      required this.address,
      required this.latitude,
      required this.longitude,
      this.description = '',
      this.totalRooms = 0,
      this.availableRooms = 0,
      this.costPerNight = 0.0,
      final List<String> amenities = const [],
      this.phoneNumber = '',
      this.email = '',
      this.contactPerson = '',
      this.rating = 0.0,
      this.reviewCount = 0,
      this.createdAt,
      this.updatedAt})
      : _amenities = amenities;

  factory _$DharamshalaImpl.fromJson(Map<String, dynamic> json) =>
      _$$DharamshalaImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String state;
  @override
  final String city;
  @override
  final String address;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final int totalRooms;
  @override
  @JsonKey()
  final int availableRooms;
  @override
  @JsonKey()
  final double costPerNight;
  final List<String> _amenities;
  @override
  @JsonKey()
  List<String> get amenities {
    if (_amenities is EqualUnmodifiableListView) return _amenities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_amenities);
  }

  @override
  @JsonKey()
  final String phoneNumber;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String contactPerson;
  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final int reviewCount;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Dharamshala(id: $id, name: $name, state: $state, city: $city, address: $address, latitude: $latitude, longitude: $longitude, description: $description, totalRooms: $totalRooms, availableRooms: $availableRooms, costPerNight: $costPerNight, amenities: $amenities, phoneNumber: $phoneNumber, email: $email, contactPerson: $contactPerson, rating: $rating, reviewCount: $reviewCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DharamshalaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.totalRooms, totalRooms) ||
                other.totalRooms == totalRooms) &&
            (identical(other.availableRooms, availableRooms) ||
                other.availableRooms == availableRooms) &&
            (identical(other.costPerNight, costPerNight) ||
                other.costPerNight == costPerNight) &&
            const DeepCollectionEquality()
                .equals(other._amenities, _amenities) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.contactPerson, contactPerson) ||
                other.contactPerson == contactPerson) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        state,
        city,
        address,
        latitude,
        longitude,
        description,
        totalRooms,
        availableRooms,
        costPerNight,
        const DeepCollectionEquality().hash(_amenities),
        phoneNumber,
        email,
        contactPerson,
        rating,
        reviewCount,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of Dharamshala
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DharamshalaImplCopyWith<_$DharamshalaImpl> get copyWith =>
      __$$DharamshalaImplCopyWithImpl<_$DharamshalaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DharamshalaImplToJson(
      this,
    );
  }
}

abstract class _Dharamshala implements Dharamshala {
  const factory _Dharamshala(
      {required final String id,
      required final String name,
      required final String state,
      required final String city,
      required final String address,
      required final double latitude,
      required final double longitude,
      final String description,
      final int totalRooms,
      final int availableRooms,
      final double costPerNight,
      final List<String> amenities,
      final String phoneNumber,
      final String email,
      final String contactPerson,
      final double rating,
      final int reviewCount,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$DharamshalaImpl;

  factory _Dharamshala.fromJson(Map<String, dynamic> json) =
      _$DharamshalaImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get state;
  @override
  String get city;
  @override
  String get address;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String get description;
  @override
  int get totalRooms;
  @override
  int get availableRooms;
  @override
  double get costPerNight;
  @override
  List<String> get amenities;
  @override
  String get phoneNumber;
  @override
  String get email;
  @override
  String get contactPerson;
  @override
  double get rating;
  @override
  int get reviewCount;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Dharamshala
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DharamshalaImplCopyWith<_$DharamshalaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
