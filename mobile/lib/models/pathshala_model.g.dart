// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pathshala_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PathshalaLessonImpl _$$PathshalaLessonImplFromJson(
        Map<String, dynamic> json) =>
    _$PathshalaLessonImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      ageGroup: json['ageGroup'] as String,
      description: json['description'] as String? ?? '',
      content: json['content'] as String? ?? '',
      videoUrl: json['videoUrl'] as String? ?? '',
      durationMinutes: (json['durationMinutes'] as num?)?.toInt() ?? 0,
      quiz: (json['quiz'] as List<dynamic>?)
              ?.map((e) => QuizQuestion.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      completionCount: (json['completionCount'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PathshalaLessonImplToJson(
        _$PathshalaLessonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'ageGroup': instance.ageGroup,
      'description': instance.description,
      'content': instance.content,
      'videoUrl': instance.videoUrl,
      'durationMinutes': instance.durationMinutes,
      'quiz': instance.quiz,
      'imageUrls': instance.imageUrls,
      'rating': instance.rating,
      'completionCount': instance.completionCount,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$QuizQuestionImpl _$$QuizQuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuizQuestionImpl(
      id: json['id'] as String,
      question: json['question'] as String,
      options:
          (json['options'] as List<dynamic>).map((e) => e as String).toList(),
      correctAnswer: (json['correctAnswer'] as num).toInt(),
      explanation: json['explanation'] as String? ?? '',
    );

Map<String, dynamic> _$$QuizQuestionImplToJson(_$QuizQuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'options': instance.options,
      'correctAnswer': instance.correctAnswer,
      'explanation': instance.explanation,
    };

_$QuizSubmissionImpl _$$QuizSubmissionImplFromJson(Map<String, dynamic> json) =>
    _$QuizSubmissionImpl(
      lessonId: json['lessonId'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      score: (json['score'] as num).toInt(),
      percentage: (json['percentage'] as num).toDouble(),
      passed: json['passed'] as bool,
    );

Map<String, dynamic> _$$QuizSubmissionImplToJson(
        _$QuizSubmissionImpl instance) =>
    <String, dynamic>{
      'lessonId': instance.lessonId,
      'answers': instance.answers,
      'score': instance.score,
      'percentage': instance.percentage,
      'passed': instance.passed,
    };
