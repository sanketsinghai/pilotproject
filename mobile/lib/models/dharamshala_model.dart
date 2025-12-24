import 'package:freezed_annotation/freezed_annotation.dart';

part 'dharamshala_model.freezed.dart';
part 'dharamshala_model.g.dart';

@freezed
class Dharamshala with _$Dharamshala {
  const factory Dharamshala({
    required String id,
    required String name,
    required String state,
    required String city,
    required String address,
    required double latitude,
    required double longitude,
    @Default('') String description,
    @Default(0) int totalRooms,
    @Default(0) int availableRooms,
    @Default(0.0) double costPerNight,
    @Default([]) List<String> amenities,
    @Default('') String phoneNumber,
    @Default('') String email,
    @Default('') String contactPerson,
    @Default(0.0) double rating,
    @Default(0) int reviewCount,
    @Default(DateTime.utc(0)) DateTime createdAt,
    @Default(DateTime.utc(0)) DateTime updatedAt,
  }) = _Dharamshala;

  factory Dharamshala.fromJson(Map<String, dynamic> json) =>
      _$DharamshalaFromJson(json);
}
