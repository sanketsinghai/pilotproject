// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'granth_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Granth _$GranthFromJson(Map<String, dynamic> json) {
  return _Granth.fromJson(json);
}

/// @nodoc
mixin _$Granth {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  String get category =>
      throw _privateConstructorUsedError; // Agama, Stotra, Sutra, etc.
  String get difficulty =>
      throw _privateConstructorUsedError; // Beginner, Intermediate, Advanced
  String get description => throw _privateConstructorUsedError;
  String get pdfUrl => throw _privateConstructorUsedError;
  String get audioUrl => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String get searchIndex =>
      throw _privateConstructorUsedError; // For full-text search
  double get rating => throw _privateConstructorUsedError;
  int get downloadCount => throw _privateConstructorUsedError;
  int get readCount => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Granth to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Granth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GranthCopyWith<Granth> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GranthCopyWith<$Res> {
  factory $GranthCopyWith(Granth value, $Res Function(Granth) then) =
      _$GranthCopyWithImpl<$Res, Granth>;
  @useResult
  $Res call(
      {String id,
      String title,
      String author,
      String language,
      String category,
      String difficulty,
      String description,
      String pdfUrl,
      String audioUrl,
      List<String> tags,
      String searchIndex,
      double rating,
      int downloadCount,
      int readCount,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$GranthCopyWithImpl<$Res, $Val extends Granth>
    implements $GranthCopyWith<$Res> {
  _$GranthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Granth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? author = null,
    Object? language = null,
    Object? category = null,
    Object? difficulty = null,
    Object? description = null,
    Object? pdfUrl = null,
    Object? audioUrl = null,
    Object? tags = null,
    Object? searchIndex = null,
    Object? rating = null,
    Object? downloadCount = null,
    Object? readCount = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      pdfUrl: null == pdfUrl
          ? _value.pdfUrl
          : pdfUrl // ignore: cast_nullable_to_non_nullable
              as String,
      audioUrl: null == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      searchIndex: null == searchIndex
          ? _value.searchIndex
          : searchIndex // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      downloadCount: null == downloadCount
          ? _value.downloadCount
          : downloadCount // ignore: cast_nullable_to_non_nullable
              as int,
      readCount: null == readCount
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
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
abstract class _$$GranthImplCopyWith<$Res> implements $GranthCopyWith<$Res> {
  factory _$$GranthImplCopyWith(
          _$GranthImpl value, $Res Function(_$GranthImpl) then) =
      __$$GranthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String author,
      String language,
      String category,
      String difficulty,
      String description,
      String pdfUrl,
      String audioUrl,
      List<String> tags,
      String searchIndex,
      double rating,
      int downloadCount,
      int readCount,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$GranthImplCopyWithImpl<$Res>
    extends _$GranthCopyWithImpl<$Res, _$GranthImpl>
    implements _$$GranthImplCopyWith<$Res> {
  __$$GranthImplCopyWithImpl(
      _$GranthImpl _value, $Res Function(_$GranthImpl) _then)
      : super(_value, _then);

  /// Create a copy of Granth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? author = null,
    Object? language = null,
    Object? category = null,
    Object? difficulty = null,
    Object? description = null,
    Object? pdfUrl = null,
    Object? audioUrl = null,
    Object? tags = null,
    Object? searchIndex = null,
    Object? rating = null,
    Object? downloadCount = null,
    Object? readCount = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$GranthImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      pdfUrl: null == pdfUrl
          ? _value.pdfUrl
          : pdfUrl // ignore: cast_nullable_to_non_nullable
              as String,
      audioUrl: null == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      searchIndex: null == searchIndex
          ? _value.searchIndex
          : searchIndex // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      downloadCount: null == downloadCount
          ? _value.downloadCount
          : downloadCount // ignore: cast_nullable_to_non_nullable
              as int,
      readCount: null == readCount
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
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
class _$GranthImpl implements _Granth {
  const _$GranthImpl(
      {required this.id,
      required this.title,
      required this.author,
      required this.language,
      required this.category,
      required this.difficulty,
      this.description = '',
      this.pdfUrl = '',
      this.audioUrl = '',
      final List<String> tags = const [],
      this.searchIndex = '',
      this.rating = 0.0,
      this.downloadCount = 0,
      this.readCount = 0,
      this.createdAt,
      this.updatedAt})
      : _tags = tags;

  factory _$GranthImpl.fromJson(Map<String, dynamic> json) =>
      _$$GranthImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String author;
  @override
  final String language;
  @override
  final String category;
// Agama, Stotra, Sutra, etc.
  @override
  final String difficulty;
// Beginner, Intermediate, Advanced
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String pdfUrl;
  @override
  @JsonKey()
  final String audioUrl;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey()
  final String searchIndex;
// For full-text search
  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final int downloadCount;
  @override
  @JsonKey()
  final int readCount;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Granth(id: $id, title: $title, author: $author, language: $language, category: $category, difficulty: $difficulty, description: $description, pdfUrl: $pdfUrl, audioUrl: $audioUrl, tags: $tags, searchIndex: $searchIndex, rating: $rating, downloadCount: $downloadCount, readCount: $readCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GranthImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl) &&
            (identical(other.audioUrl, audioUrl) ||
                other.audioUrl == audioUrl) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.searchIndex, searchIndex) ||
                other.searchIndex == searchIndex) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.downloadCount, downloadCount) ||
                other.downloadCount == downloadCount) &&
            (identical(other.readCount, readCount) ||
                other.readCount == readCount) &&
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
      title,
      author,
      language,
      category,
      difficulty,
      description,
      pdfUrl,
      audioUrl,
      const DeepCollectionEquality().hash(_tags),
      searchIndex,
      rating,
      downloadCount,
      readCount,
      createdAt,
      updatedAt);

  /// Create a copy of Granth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GranthImplCopyWith<_$GranthImpl> get copyWith =>
      __$$GranthImplCopyWithImpl<_$GranthImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GranthImplToJson(
      this,
    );
  }
}

abstract class _Granth implements Granth {
  const factory _Granth(
      {required final String id,
      required final String title,
      required final String author,
      required final String language,
      required final String category,
      required final String difficulty,
      final String description,
      final String pdfUrl,
      final String audioUrl,
      final List<String> tags,
      final String searchIndex,
      final double rating,
      final int downloadCount,
      final int readCount,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$GranthImpl;

  factory _Granth.fromJson(Map<String, dynamic> json) = _$GranthImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get author;
  @override
  String get language;
  @override
  String get category; // Agama, Stotra, Sutra, etc.
  @override
  String get difficulty; // Beginner, Intermediate, Advanced
  @override
  String get description;
  @override
  String get pdfUrl;
  @override
  String get audioUrl;
  @override
  List<String> get tags;
  @override
  String get searchIndex; // For full-text search
  @override
  double get rating;
  @override
  int get downloadCount;
  @override
  int get readCount;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Granth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GranthImplCopyWith<_$GranthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
