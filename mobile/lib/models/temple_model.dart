import 'package:freezed_annotation/freezed_annotation.dart';

part 'temple_model.freezed.dart';
part 'temple_model.g.dart';

@freezed
class Temple with _$Temple {
  const factory Temple({
    required String id,
    required String name,
    required String state,
    required String city,
    required String address,
    required double latitude,
    required double longitude,
    @Default('') String description,
    @Default([]) List<String> imageUrls,
    @Default([]) List<String> amenities,
    @Default('') String phoneNumber,
    @Default('') String email,
    @Default('') String website,
    @Default('') String timings,
    @Default(0.0) double rating,
    @Default(0) int reviewCount,
    @Default('') String sect, // Shvetambara, Digambara, etc.
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Temple;

  factory Temple.fromJson(Map<String, dynamic> json) =>
      _$TempleFromJson(json);
}
