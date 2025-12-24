// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Trip _$TripFromJson(Map<String, dynamic> json) {
  return _Trip.fromJson(json);
}

/// @nodoc
mixin _$Trip {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  double get estimatedBudget => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  List<String> get templeIds => throw _privateConstructorUsedError;
  List<String> get dharamshalaIds => throw _privateConstructorUsedError;
  List<DayItinerary> get itinerary => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // draft, published, completed
  bool get isPublic => throw _privateConstructorUsedError;
  String get shareLink => throw _privateConstructorUsedError;
  int get followers => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Trip to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Trip
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TripCopyWith<Trip> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripCopyWith<$Res> {
  factory $TripCopyWith(Trip value, $Res Function(Trip) then) =
      _$TripCopyWithImpl<$Res, Trip>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String title,
      String description,
      DateTime startDate,
      DateTime endDate,
      double estimatedBudget,
      double distance,
      List<String> templeIds,
      List<String> dharamshalaIds,
      List<DayItinerary> itinerary,
      String status,
      bool isPublic,
      String shareLink,
      int followers,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$TripCopyWithImpl<$Res, $Val extends Trip>
    implements $TripCopyWith<$Res> {
  _$TripCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Trip
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? description = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? estimatedBudget = null,
    Object? distance = null,
    Object? templeIds = null,
    Object? dharamshalaIds = null,
    Object? itinerary = null,
    Object? status = null,
    Object? isPublic = null,
    Object? shareLink = null,
    Object? followers = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      estimatedBudget: null == estimatedBudget
          ? _value.estimatedBudget
          : estimatedBudget // ignore: cast_nullable_to_non_nullable
              as double,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      templeIds: null == templeIds
          ? _value.templeIds
          : templeIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dharamshalaIds: null == dharamshalaIds
          ? _value.dharamshalaIds
          : dharamshalaIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      itinerary: null == itinerary
          ? _value.itinerary
          : itinerary // ignore: cast_nullable_to_non_nullable
              as List<DayItinerary>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      shareLink: null == shareLink
          ? _value.shareLink
          : shareLink // ignore: cast_nullable_to_non_nullable
              as String,
      followers: null == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
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
abstract class _$$TripImplCopyWith<$Res> implements $TripCopyWith<$Res> {
  factory _$$TripImplCopyWith(
          _$TripImpl value, $Res Function(_$TripImpl) then) =
      __$$TripImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String title,
      String description,
      DateTime startDate,
      DateTime endDate,
      double estimatedBudget,
      double distance,
      List<String> templeIds,
      List<String> dharamshalaIds,
      List<DayItinerary> itinerary,
      String status,
      bool isPublic,
      String shareLink,
      int followers,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$TripImplCopyWithImpl<$Res>
    extends _$TripCopyWithImpl<$Res, _$TripImpl>
    implements _$$TripImplCopyWith<$Res> {
  __$$TripImplCopyWithImpl(_$TripImpl _value, $Res Function(_$TripImpl) _then)
      : super(_value, _then);

  /// Create a copy of Trip
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? description = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? estimatedBudget = null,
    Object? distance = null,
    Object? templeIds = null,
    Object? dharamshalaIds = null,
    Object? itinerary = null,
    Object? status = null,
    Object? isPublic = null,
    Object? shareLink = null,
    Object? followers = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$TripImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      estimatedBudget: null == estimatedBudget
          ? _value.estimatedBudget
          : estimatedBudget // ignore: cast_nullable_to_non_nullable
              as double,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      templeIds: null == templeIds
          ? _value._templeIds
          : templeIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dharamshalaIds: null == dharamshalaIds
          ? _value._dharamshalaIds
          : dharamshalaIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      itinerary: null == itinerary
          ? _value._itinerary
          : itinerary // ignore: cast_nullable_to_non_nullable
              as List<DayItinerary>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      shareLink: null == shareLink
          ? _value.shareLink
          : shareLink // ignore: cast_nullable_to_non_nullable
              as String,
      followers: null == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
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
class _$TripImpl implements _Trip {
  const _$TripImpl(
      {required this.id,
      required this.userId,
      required this.title,
      required this.description,
      required this.startDate,
      required this.endDate,
      this.estimatedBudget = 0.0,
      this.distance = 0.0,
      final List<String> templeIds = const [],
      final List<String> dharamshalaIds = const [],
      final List<DayItinerary> itinerary = const [],
      this.status = 'draft',
      this.isPublic = false,
      this.shareLink = '',
      this.followers = 0,
      this.createdAt,
      this.updatedAt})
      : _templeIds = templeIds,
        _dharamshalaIds = dharamshalaIds,
        _itinerary = itinerary;

  factory _$TripImpl.fromJson(Map<String, dynamic> json) =>
      _$$TripImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String title;
  @override
  final String description;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  @JsonKey()
  final double estimatedBudget;
  @override
  @JsonKey()
  final double distance;
  final List<String> _templeIds;
  @override
  @JsonKey()
  List<String> get templeIds {
    if (_templeIds is EqualUnmodifiableListView) return _templeIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_templeIds);
  }

  final List<String> _dharamshalaIds;
  @override
  @JsonKey()
  List<String> get dharamshalaIds {
    if (_dharamshalaIds is EqualUnmodifiableListView) return _dharamshalaIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dharamshalaIds);
  }

  final List<DayItinerary> _itinerary;
  @override
  @JsonKey()
  List<DayItinerary> get itinerary {
    if (_itinerary is EqualUnmodifiableListView) return _itinerary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itinerary);
  }

  @override
  @JsonKey()
  final String status;
// draft, published, completed
  @override
  @JsonKey()
  final bool isPublic;
  @override
  @JsonKey()
  final String shareLink;
  @override
  @JsonKey()
  final int followers;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Trip(id: $id, userId: $userId, title: $title, description: $description, startDate: $startDate, endDate: $endDate, estimatedBudget: $estimatedBudget, distance: $distance, templeIds: $templeIds, dharamshalaIds: $dharamshalaIds, itinerary: $itinerary, status: $status, isPublic: $isPublic, shareLink: $shareLink, followers: $followers, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.estimatedBudget, estimatedBudget) ||
                other.estimatedBudget == estimatedBudget) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            const DeepCollectionEquality()
                .equals(other._templeIds, _templeIds) &&
            const DeepCollectionEquality()
                .equals(other._dharamshalaIds, _dharamshalaIds) &&
            const DeepCollectionEquality()
                .equals(other._itinerary, _itinerary) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            (identical(other.shareLink, shareLink) ||
                other.shareLink == shareLink) &&
            (identical(other.followers, followers) ||
                other.followers == followers) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      title,
      description,
      startDate,
      endDate,
      estimatedBudget,
      distance,
      const DeepCollectionEquality().hash(_templeIds),
      const DeepCollectionEquality().hash(_dharamshalaIds),
      const DeepCollectionEquality().hash(_itinerary),
      status,
      isPublic,
      shareLink,
      followers,
      createdAt,
      updatedAt);

  /// Create a copy of Trip
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TripImplCopyWith<_$TripImpl> get copyWith =>
      __$$TripImplCopyWithImpl<_$TripImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TripImplToJson(
      this,
    );
  }
}

abstract class _Trip implements Trip {
  const factory _Trip(
      {required final String id,
      required final String userId,
      required final String title,
      required final String description,
      required final DateTime startDate,
      required final DateTime endDate,
      final double estimatedBudget,
      final double distance,
      final List<String> templeIds,
      final List<String> dharamshalaIds,
      final List<DayItinerary> itinerary,
      final String status,
      final bool isPublic,
      final String shareLink,
      final int followers,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$TripImpl;

  factory _Trip.fromJson(Map<String, dynamic> json) = _$TripImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get title;
  @override
  String get description;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  double get estimatedBudget;
  @override
  double get distance;
  @override
  List<String> get templeIds;
  @override
  List<String> get dharamshalaIds;
  @override
  List<DayItinerary> get itinerary;
  @override
  String get status; // draft, published, completed
  @override
  bool get isPublic;
  @override
  String get shareLink;
  @override
  int get followers;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Trip
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TripImplCopyWith<_$TripImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DayItinerary _$DayItineraryFromJson(Map<String, dynamic> json) {
  return _DayItinerary.fromJson(json);
}

/// @nodoc
mixin _$DayItinerary {
  int get day => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  List<String> get activities => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;

  /// Serializes this DayItinerary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DayItinerary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DayItineraryCopyWith<DayItinerary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayItineraryCopyWith<$Res> {
  factory $DayItineraryCopyWith(
          DayItinerary value, $Res Function(DayItinerary) then) =
      _$DayItineraryCopyWithImpl<$Res, DayItinerary>;
  @useResult
  $Res call(
      {int day,
      String location,
      List<String> activities,
      String notes,
      double distance});
}

/// @nodoc
class _$DayItineraryCopyWithImpl<$Res, $Val extends DayItinerary>
    implements $DayItineraryCopyWith<$Res> {
  _$DayItineraryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DayItinerary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? location = null,
    Object? activities = null,
    Object? notes = null,
    Object? distance = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      activities: null == activities
          ? _value.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DayItineraryImplCopyWith<$Res>
    implements $DayItineraryCopyWith<$Res> {
  factory _$$DayItineraryImplCopyWith(
          _$DayItineraryImpl value, $Res Function(_$DayItineraryImpl) then) =
      __$$DayItineraryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int day,
      String location,
      List<String> activities,
      String notes,
      double distance});
}

/// @nodoc
class __$$DayItineraryImplCopyWithImpl<$Res>
    extends _$DayItineraryCopyWithImpl<$Res, _$DayItineraryImpl>
    implements _$$DayItineraryImplCopyWith<$Res> {
  __$$DayItineraryImplCopyWithImpl(
      _$DayItineraryImpl _value, $Res Function(_$DayItineraryImpl) _then)
      : super(_value, _then);

  /// Create a copy of DayItinerary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? location = null,
    Object? activities = null,
    Object? notes = null,
    Object? distance = null,
  }) {
    return _then(_$DayItineraryImpl(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      activities: null == activities
          ? _value._activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DayItineraryImpl implements _DayItinerary {
  const _$DayItineraryImpl(
      {required this.day,
      required this.location,
      final List<String> activities = const [],
      this.notes = '',
      this.distance = 0.0})
      : _activities = activities;

  factory _$DayItineraryImpl.fromJson(Map<String, dynamic> json) =>
      _$$DayItineraryImplFromJson(json);

  @override
  final int day;
  @override
  final String location;
  final List<String> _activities;
  @override
  @JsonKey()
  List<String> get activities {
    if (_activities is EqualUnmodifiableListView) return _activities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activities);
  }

  @override
  @JsonKey()
  final String notes;
  @override
  @JsonKey()
  final double distance;

  @override
  String toString() {
    return 'DayItinerary(day: $day, location: $location, activities: $activities, notes: $notes, distance: $distance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayItineraryImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality()
                .equals(other._activities, _activities) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, day, location,
      const DeepCollectionEquality().hash(_activities), notes, distance);

  /// Create a copy of DayItinerary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DayItineraryImplCopyWith<_$DayItineraryImpl> get copyWith =>
      __$$DayItineraryImplCopyWithImpl<_$DayItineraryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DayItineraryImplToJson(
      this,
    );
  }
}

abstract class _DayItinerary implements DayItinerary {
  const factory _DayItinerary(
      {required final int day,
      required final String location,
      final List<String> activities,
      final String notes,
      final double distance}) = _$DayItineraryImpl;

  factory _DayItinerary.fromJson(Map<String, dynamic> json) =
      _$DayItineraryImpl.fromJson;

  @override
  int get day;
  @override
  String get location;
  @override
  List<String> get activities;
  @override
  String get notes;
  @override
  double get distance;

  /// Create a copy of DayItinerary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DayItineraryImplCopyWith<_$DayItineraryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
