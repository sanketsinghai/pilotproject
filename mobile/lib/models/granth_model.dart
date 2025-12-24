import 'package:freezed_annotation/freezed_annotation.dart';

part 'granth_model.freezed.dart';
part 'granth_model.g.dart';

@freezed
class Granth with _$Granth {
  const factory Granth({
    required String id,
    required String title,
    required String author,
    required String language,
    required String category, // Agama, Stotra, Sutra, etc.
    required String difficulty, // Beginner, Intermediate, Advanced
    @Default('') String description,
    @Default('') String pdfUrl,
    @Default('') String audioUrl,
    @Default([]) List<String> tags,
    @Default('') String searchIndex, // For full-text search
    @Default(0.0) double rating,
    @Default(0) int downloadCount,
    @Default(0) int readCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Granth;

  factory Granth.fromJson(Map<String, dynamic> json) =>
      _$GranthFromJson(json);
}
