import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_model.freezed.dart';
part 'trip_model.g.dart';

@freezed
class Trip with _$Trip {
  const factory Trip({
    required String id,
    required String userId,
    required String title,
    required String description,
    required DateTime startDate,
    required DateTime endDate,
    @Default(0.0) double estimatedBudget,
    @Default(0.0) double distance,
    @Default([]) List<String> templeIds,
    @Default([]) List<String> dharamshalaIds,
    @Default([]) List<DayItinerary> itinerary,
    @Default('draft') String status, // draft, published, completed
    @Default(false) bool isPublic,
    @Default('') String shareLink,
    @Default(0) int followers,
    @Default(DateTime.utc(0)) DateTime createdAt,
    @Default(DateTime.utc(0)) DateTime updatedAt,
  }) = _Trip;

  factory Trip.fromJson(Map<String, dynamic> json) =>
      _$TripFromJson(json);
}

@freezed
class DayItinerary with _$DayItinerary {
  const factory DayItinerary({
    required int day,
    required String location,
    @Default([]) List<String> activities,
    @Default('') String notes,
    @Default(0.0) double distance,
  }) = _DayItinerary;

  factory DayItinerary.fromJson(Map<String, dynamic> json) =>
      _$DayItineraryFromJson(json);
}
