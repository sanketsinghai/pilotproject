import 'package:freezed_annotation/freezed_annotation.dart';

part 'pathshala_model.freezed.dart';
part 'pathshala_model.g.dart';

@freezed
class PathshalaLesson with _$PathshalaLesson {
  const factory PathshalaLesson({
    required String id,
    required String title,
    required String ageGroup, // 5-8, 9-12, 13-16, 17+
    @Default('') String description,
    @Default('') String content,
    @Default('') String videoUrl,
    @Default(0) int durationMinutes,
    @Default([]) List<QuizQuestion> quiz,
    @Default([]) List<String> imageUrls,
    @Default(0.0) double rating,
    @Default(0) int completionCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _PathshalaLesson;

  factory PathshalaLesson.fromJson(Map<String, dynamic> json) =>
      _$PathshalaLessonFromJson(json);
}

@freezed
class QuizQuestion with _$QuizQuestion {
  const factory QuizQuestion({
    required String id,
    required String question,
    required List<String> options,
    required int correctAnswer, // Index of correct option
    @Default('') String explanation,
  }) = _QuizQuestion;

  factory QuizQuestion.fromJson(Map<String, dynamic> json) =>
      _$QuizQuestionFromJson(json);
}

@freezed
class QuizSubmission with _$QuizSubmission {
  const factory QuizSubmission({
    required String lessonId,
    required List<int> answers,
    required int score,
    required double percentage,
    required bool passed,
  }) = _QuizSubmission;

  factory QuizSubmission.fromJson(Map<String, dynamic> json) =>
      _$QuizSubmissionFromJson(json);
}
