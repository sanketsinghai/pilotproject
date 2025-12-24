// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pathshala_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PathshalaLesson _$PathshalaLessonFromJson(Map<String, dynamic> json) {
  return _PathshalaLesson.fromJson(json);
}

/// @nodoc
mixin _$PathshalaLesson {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get ageGroup =>
      throw _privateConstructorUsedError; // 5-8, 9-12, 13-16, 17+
  String get description => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get videoUrl => throw _privateConstructorUsedError;
  int get durationMinutes => throw _privateConstructorUsedError;
  List<QuizQuestion> get quiz => throw _privateConstructorUsedError;
  List<String> get imageUrls => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get completionCount => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PathshalaLesson to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PathshalaLesson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PathshalaLessonCopyWith<PathshalaLesson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PathshalaLessonCopyWith<$Res> {
  factory $PathshalaLessonCopyWith(
          PathshalaLesson value, $Res Function(PathshalaLesson) then) =
      _$PathshalaLessonCopyWithImpl<$Res, PathshalaLesson>;
  @useResult
  $Res call(
      {String id,
      String title,
      String ageGroup,
      String description,
      String content,
      String videoUrl,
      int durationMinutes,
      List<QuizQuestion> quiz,
      List<String> imageUrls,
      double rating,
      int completionCount,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$PathshalaLessonCopyWithImpl<$Res, $Val extends PathshalaLesson>
    implements $PathshalaLessonCopyWith<$Res> {
  _$PathshalaLessonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PathshalaLesson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? ageGroup = null,
    Object? description = null,
    Object? content = null,
    Object? videoUrl = null,
    Object? durationMinutes = null,
    Object? quiz = null,
    Object? imageUrls = null,
    Object? rating = null,
    Object? completionCount = null,
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
      ageGroup: null == ageGroup
          ? _value.ageGroup
          : ageGroup // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      quiz: null == quiz
          ? _value.quiz
          : quiz // ignore: cast_nullable_to_non_nullable
              as List<QuizQuestion>,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      completionCount: null == completionCount
          ? _value.completionCount
          : completionCount // ignore: cast_nullable_to_non_nullable
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
abstract class _$$PathshalaLessonImplCopyWith<$Res>
    implements $PathshalaLessonCopyWith<$Res> {
  factory _$$PathshalaLessonImplCopyWith(_$PathshalaLessonImpl value,
          $Res Function(_$PathshalaLessonImpl) then) =
      __$$PathshalaLessonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String ageGroup,
      String description,
      String content,
      String videoUrl,
      int durationMinutes,
      List<QuizQuestion> quiz,
      List<String> imageUrls,
      double rating,
      int completionCount,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$PathshalaLessonImplCopyWithImpl<$Res>
    extends _$PathshalaLessonCopyWithImpl<$Res, _$PathshalaLessonImpl>
    implements _$$PathshalaLessonImplCopyWith<$Res> {
  __$$PathshalaLessonImplCopyWithImpl(
      _$PathshalaLessonImpl _value, $Res Function(_$PathshalaLessonImpl) _then)
      : super(_value, _then);

  /// Create a copy of PathshalaLesson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? ageGroup = null,
    Object? description = null,
    Object? content = null,
    Object? videoUrl = null,
    Object? durationMinutes = null,
    Object? quiz = null,
    Object? imageUrls = null,
    Object? rating = null,
    Object? completionCount = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PathshalaLessonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      ageGroup: null == ageGroup
          ? _value.ageGroup
          : ageGroup // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      quiz: null == quiz
          ? _value._quiz
          : quiz // ignore: cast_nullable_to_non_nullable
              as List<QuizQuestion>,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      completionCount: null == completionCount
          ? _value.completionCount
          : completionCount // ignore: cast_nullable_to_non_nullable
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
class _$PathshalaLessonImpl implements _PathshalaLesson {
  const _$PathshalaLessonImpl(
      {required this.id,
      required this.title,
      required this.ageGroup,
      this.description = '',
      this.content = '',
      this.videoUrl = '',
      this.durationMinutes = 0,
      final List<QuizQuestion> quiz = const [],
      final List<String> imageUrls = const [],
      this.rating = 0.0,
      this.completionCount = 0,
      this.createdAt,
      this.updatedAt})
      : _quiz = quiz,
        _imageUrls = imageUrls;

  factory _$PathshalaLessonImpl.fromJson(Map<String, dynamic> json) =>
      _$$PathshalaLessonImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String ageGroup;
// 5-8, 9-12, 13-16, 17+
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final String videoUrl;
  @override
  @JsonKey()
  final int durationMinutes;
  final List<QuizQuestion> _quiz;
  @override
  @JsonKey()
  List<QuizQuestion> get quiz {
    if (_quiz is EqualUnmodifiableListView) return _quiz;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quiz);
  }

  final List<String> _imageUrls;
  @override
  @JsonKey()
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final int completionCount;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PathshalaLesson(id: $id, title: $title, ageGroup: $ageGroup, description: $description, content: $content, videoUrl: $videoUrl, durationMinutes: $durationMinutes, quiz: $quiz, imageUrls: $imageUrls, rating: $rating, completionCount: $completionCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PathshalaLessonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.ageGroup, ageGroup) ||
                other.ageGroup == ageGroup) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            const DeepCollectionEquality().equals(other._quiz, _quiz) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.completionCount, completionCount) ||
                other.completionCount == completionCount) &&
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
      ageGroup,
      description,
      content,
      videoUrl,
      durationMinutes,
      const DeepCollectionEquality().hash(_quiz),
      const DeepCollectionEquality().hash(_imageUrls),
      rating,
      completionCount,
      createdAt,
      updatedAt);

  /// Create a copy of PathshalaLesson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PathshalaLessonImplCopyWith<_$PathshalaLessonImpl> get copyWith =>
      __$$PathshalaLessonImplCopyWithImpl<_$PathshalaLessonImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PathshalaLessonImplToJson(
      this,
    );
  }
}

abstract class _PathshalaLesson implements PathshalaLesson {
  const factory _PathshalaLesson(
      {required final String id,
      required final String title,
      required final String ageGroup,
      final String description,
      final String content,
      final String videoUrl,
      final int durationMinutes,
      final List<QuizQuestion> quiz,
      final List<String> imageUrls,
      final double rating,
      final int completionCount,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$PathshalaLessonImpl;

  factory _PathshalaLesson.fromJson(Map<String, dynamic> json) =
      _$PathshalaLessonImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get ageGroup; // 5-8, 9-12, 13-16, 17+
  @override
  String get description;
  @override
  String get content;
  @override
  String get videoUrl;
  @override
  int get durationMinutes;
  @override
  List<QuizQuestion> get quiz;
  @override
  List<String> get imageUrls;
  @override
  double get rating;
  @override
  int get completionCount;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of PathshalaLesson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PathshalaLessonImplCopyWith<_$PathshalaLessonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizQuestion _$QuizQuestionFromJson(Map<String, dynamic> json) {
  return _QuizQuestion.fromJson(json);
}

/// @nodoc
mixin _$QuizQuestion {
  String get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  List<String> get options => throw _privateConstructorUsedError;
  int get correctAnswer =>
      throw _privateConstructorUsedError; // Index of correct option
  String get explanation => throw _privateConstructorUsedError;

  /// Serializes this QuizQuestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizQuestionCopyWith<QuizQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizQuestionCopyWith<$Res> {
  factory $QuizQuestionCopyWith(
          QuizQuestion value, $Res Function(QuizQuestion) then) =
      _$QuizQuestionCopyWithImpl<$Res, QuizQuestion>;
  @useResult
  $Res call(
      {String id,
      String question,
      List<String> options,
      int correctAnswer,
      String explanation});
}

/// @nodoc
class _$QuizQuestionCopyWithImpl<$Res, $Val extends QuizQuestion>
    implements $QuizQuestionCopyWith<$Res> {
  _$QuizQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? options = null,
    Object? correctAnswer = null,
    Object? explanation = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctAnswer: null == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizQuestionImplCopyWith<$Res>
    implements $QuizQuestionCopyWith<$Res> {
  factory _$$QuizQuestionImplCopyWith(
          _$QuizQuestionImpl value, $Res Function(_$QuizQuestionImpl) then) =
      __$$QuizQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String question,
      List<String> options,
      int correctAnswer,
      String explanation});
}

/// @nodoc
class __$$QuizQuestionImplCopyWithImpl<$Res>
    extends _$QuizQuestionCopyWithImpl<$Res, _$QuizQuestionImpl>
    implements _$$QuizQuestionImplCopyWith<$Res> {
  __$$QuizQuestionImplCopyWithImpl(
      _$QuizQuestionImpl _value, $Res Function(_$QuizQuestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? options = null,
    Object? correctAnswer = null,
    Object? explanation = null,
  }) {
    return _then(_$QuizQuestionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctAnswer: null == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizQuestionImpl implements _QuizQuestion {
  const _$QuizQuestionImpl(
      {required this.id,
      required this.question,
      required final List<String> options,
      required this.correctAnswer,
      this.explanation = ''})
      : _options = options;

  factory _$QuizQuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizQuestionImplFromJson(json);

  @override
  final String id;
  @override
  final String question;
  final List<String> _options;
  @override
  List<String> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  final int correctAnswer;
// Index of correct option
  @override
  @JsonKey()
  final String explanation;

  @override
  String toString() {
    return 'QuizQuestion(id: $id, question: $question, options: $options, correctAnswer: $correctAnswer, explanation: $explanation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizQuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      question,
      const DeepCollectionEquality().hash(_options),
      correctAnswer,
      explanation);

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizQuestionImplCopyWith<_$QuizQuestionImpl> get copyWith =>
      __$$QuizQuestionImplCopyWithImpl<_$QuizQuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizQuestionImplToJson(
      this,
    );
  }
}

abstract class _QuizQuestion implements QuizQuestion {
  const factory _QuizQuestion(
      {required final String id,
      required final String question,
      required final List<String> options,
      required final int correctAnswer,
      final String explanation}) = _$QuizQuestionImpl;

  factory _QuizQuestion.fromJson(Map<String, dynamic> json) =
      _$QuizQuestionImpl.fromJson;

  @override
  String get id;
  @override
  String get question;
  @override
  List<String> get options;
  @override
  int get correctAnswer; // Index of correct option
  @override
  String get explanation;

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizQuestionImplCopyWith<_$QuizQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizSubmission _$QuizSubmissionFromJson(Map<String, dynamic> json) {
  return _QuizSubmission.fromJson(json);
}

/// @nodoc
mixin _$QuizSubmission {
  String get lessonId => throw _privateConstructorUsedError;
  List<int> get answers => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;
  bool get passed => throw _privateConstructorUsedError;

  /// Serializes this QuizSubmission to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizSubmission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizSubmissionCopyWith<QuizSubmission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizSubmissionCopyWith<$Res> {
  factory $QuizSubmissionCopyWith(
          QuizSubmission value, $Res Function(QuizSubmission) then) =
      _$QuizSubmissionCopyWithImpl<$Res, QuizSubmission>;
  @useResult
  $Res call(
      {String lessonId,
      List<int> answers,
      int score,
      double percentage,
      bool passed});
}

/// @nodoc
class _$QuizSubmissionCopyWithImpl<$Res, $Val extends QuizSubmission>
    implements $QuizSubmissionCopyWith<$Res> {
  _$QuizSubmissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizSubmission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessonId = null,
    Object? answers = null,
    Object? score = null,
    Object? percentage = null,
    Object? passed = null,
  }) {
    return _then(_value.copyWith(
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      passed: null == passed
          ? _value.passed
          : passed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizSubmissionImplCopyWith<$Res>
    implements $QuizSubmissionCopyWith<$Res> {
  factory _$$QuizSubmissionImplCopyWith(_$QuizSubmissionImpl value,
          $Res Function(_$QuizSubmissionImpl) then) =
      __$$QuizSubmissionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String lessonId,
      List<int> answers,
      int score,
      double percentage,
      bool passed});
}

/// @nodoc
class __$$QuizSubmissionImplCopyWithImpl<$Res>
    extends _$QuizSubmissionCopyWithImpl<$Res, _$QuizSubmissionImpl>
    implements _$$QuizSubmissionImplCopyWith<$Res> {
  __$$QuizSubmissionImplCopyWithImpl(
      _$QuizSubmissionImpl _value, $Res Function(_$QuizSubmissionImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizSubmission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessonId = null,
    Object? answers = null,
    Object? score = null,
    Object? percentage = null,
    Object? passed = null,
  }) {
    return _then(_$QuizSubmissionImpl(
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      passed: null == passed
          ? _value.passed
          : passed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizSubmissionImpl implements _QuizSubmission {
  const _$QuizSubmissionImpl(
      {required this.lessonId,
      required final List<int> answers,
      required this.score,
      required this.percentage,
      required this.passed})
      : _answers = answers;

  factory _$QuizSubmissionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizSubmissionImplFromJson(json);

  @override
  final String lessonId;
  final List<int> _answers;
  @override
  List<int> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  final int score;
  @override
  final double percentage;
  @override
  final bool passed;

  @override
  String toString() {
    return 'QuizSubmission(lessonId: $lessonId, answers: $answers, score: $score, percentage: $percentage, passed: $passed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizSubmissionImpl &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.passed, passed) || other.passed == passed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lessonId,
      const DeepCollectionEquality().hash(_answers), score, percentage, passed);

  /// Create a copy of QuizSubmission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizSubmissionImplCopyWith<_$QuizSubmissionImpl> get copyWith =>
      __$$QuizSubmissionImplCopyWithImpl<_$QuizSubmissionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizSubmissionImplToJson(
      this,
    );
  }
}

abstract class _QuizSubmission implements QuizSubmission {
  const factory _QuizSubmission(
      {required final String lessonId,
      required final List<int> answers,
      required final int score,
      required final double percentage,
      required final bool passed}) = _$QuizSubmissionImpl;

  factory _QuizSubmission.fromJson(Map<String, dynamic> json) =
      _$QuizSubmissionImpl.fromJson;

  @override
  String get lessonId;
  @override
  List<int> get answers;
  @override
  int get score;
  @override
  double get percentage;
  @override
  bool get passed;

  /// Create a copy of QuizSubmission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizSubmissionImplCopyWith<_$QuizSubmissionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
