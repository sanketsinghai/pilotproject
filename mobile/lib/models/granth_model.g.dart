// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'granth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GranthImpl _$$GranthImplFromJson(Map<String, dynamic> json) => _$GranthImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      language: json['language'] as String,
      category: json['category'] as String,
      difficulty: json['difficulty'] as String,
      description: json['description'] as String? ?? '',
      pdfUrl: json['pdfUrl'] as String? ?? '',
      audioUrl: json['audioUrl'] as String? ?? '',
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      searchIndex: json['searchIndex'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      downloadCount: (json['downloadCount'] as num?)?.toInt() ?? 0,
      readCount: (json['readCount'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$GranthImplToJson(_$GranthImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'language': instance.language,
      'category': instance.category,
      'difficulty': instance.difficulty,
      'description': instance.description,
      'pdfUrl': instance.pdfUrl,
      'audioUrl': instance.audioUrl,
      'tags': instance.tags,
      'searchIndex': instance.searchIndex,
      'rating': instance.rating,
      'downloadCount': instance.downloadCount,
      'readCount': instance.readCount,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
