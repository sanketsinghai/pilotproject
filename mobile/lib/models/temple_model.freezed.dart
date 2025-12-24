// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'temple_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Temple _$TempleFromJson(Map<String, dynamic> json) {
  return _Temple.fromJson(json);
}

/// @nodoc
mixin _$Temple {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get imageUrls => throw _privateConstructorUsedError;
  List<String> get amenities => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get website => throw _privateConstructorUsedError;
  String get timings => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get reviewCount => throw _privateConstructorUsedError;
  String get sect =>
      throw _privateConstructorUsedError; // Shvetambara, Digambara, etc.
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Temple to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Temple
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TempleCopyWith<Temple> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TempleCopyWith<$Res> {
  factory $TempleCopyWith(Temple value, $Res Function(Temple) then) =
      _$TempleCopyWithImpl<$Res, Temple>;
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
      List<String> imageUrls,
      List<String> amenities,
      String phoneNumber,
      String email,
      String website,
      String timings,
      double rating,
      int reviewCount,
      String sect,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$TempleCopyWithImpl<$Res, $Val extends Temple>
    implements $TempleCopyWith<$Res> {
  _$TempleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Temple
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
    Object? imageUrls = null,
    Object? amenities = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? website = null,
    Object? timings = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? sect = null,
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
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      timings: null == timings
          ? _value.timings
          : timings // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      sect: null == sect
          ? _value.sect
          : sect // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$TempleImplCopyWith<$Res> implements $TempleCopyWith<$Res> {
  factory _$$TempleImplCopyWith(
          _$TempleImpl value, $Res Function(_$TempleImpl) then) =
      __$$TempleImplCopyWithImpl<$Res>;
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
      List<String> imageUrls,
      List<String> amenities,
      String phoneNumber,
      String email,
      String website,
      String timings,
      double rating,
      int reviewCount,
      String sect,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$TempleImplCopyWithImpl<$Res>
    extends _$TempleCopyWithImpl<$Res, _$TempleImpl>
    implements _$$TempleImplCopyWith<$Res> {
  __$$TempleImplCopyWithImpl(
      _$TempleImpl _value, $Res Function(_$TempleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Temple
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
    Object? imageUrls = null,
    Object? amenities = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? website = null,
    Object? timings = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? sect = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$TempleImpl(
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
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      timings: null == timings
          ? _value.timings
          : timings // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      sect: null == sect
          ? _value.sect
          : sect // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$TempleImpl implements _Temple {
  const _$TempleImpl(
      {required this.id,
      required this.name,
      required this.state,
      required this.city,
      required this.address,
      required this.latitude,
      required this.longitude,
      this.description = '',
      final List<String> imageUrls = const [],
      final List<String> amenities = const [],
      this.phoneNumber = '',
      this.email = '',
      this.website = '',
      this.timings = '',
      this.rating = 0.0,
      this.reviewCount = 0,
      this.sect = '',
      this.createdAt,
      this.updatedAt})
      : _imageUrls = imageUrls,
        _amenities = amenities;

  factory _$TempleImpl.fromJson(Map<String, dynamic> json) =>
      _$$TempleImplFromJson(json);

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
  final List<String> _imageUrls;
  @override
  @JsonKey()
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

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
  final String website;
  @override
  @JsonKey()
  final String timings;
  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final int reviewCount;
  @override
  @JsonKey()
  final String sect;
// Shvetambara, Digambara, etc.
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Temple(id: $id, name: $name, state: $state, city: $city, address: $address, latitude: $latitude, longitude: $longitude, description: $description, imageUrls: $imageUrls, amenities: $amenities, phoneNumber: $phoneNumber, email: $email, website: $website, timings: $timings, rating: $rating, reviewCount: $reviewCount, sect: $sect, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TempleImpl &&
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
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            const DeepCollectionEquality()
                .equals(other._amenities, _amenities) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.timings, timings) || other.timings == timings) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.sect, sect) || other.sect == sect) &&
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
        const DeepCollectionEquality().hash(_imageUrls),
        const DeepCollectionEquality().hash(_amenities),
        phoneNumber,
        email,
        website,
        timings,
        rating,
        reviewCount,
        sect,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of Temple
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TempleImplCopyWith<_$TempleImpl> get copyWith =>
      __$$TempleImplCopyWithImpl<_$TempleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TempleImplToJson(
      this,
    );
  }
}

abstract class _Temple implements Temple {
  const factory _Temple(
      {required final String id,
      required final String name,
      required final String state,
      required final String city,
      required final String address,
      required final double latitude,
      required final double longitude,
      final String description,
      final List<String> imageUrls,
      final List<String> amenities,
      final String phoneNumber,
      final String email,
      final String website,
      final String timings,
      final double rating,
      final int reviewCount,
      final String sect,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$TempleImpl;

  factory _Temple.fromJson(Map<String, dynamic> json) = _$TempleImpl.fromJson;

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
  List<String> get imageUrls;
  @override
  List<String> get amenities;
  @override
  String get phoneNumber;
  @override
  String get email;
  @override
  String get website;
  @override
  String get timings;
  @override
  double get rating;
  @override
  int get reviewCount;
  @override
  String get sect; // Shvetambara, Digambara, etc.
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Temple
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TempleImplCopyWith<_$TempleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
