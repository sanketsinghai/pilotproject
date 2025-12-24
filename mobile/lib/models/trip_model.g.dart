// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TripImpl _$$TripImplFromJson(Map<String, dynamic> json) => _$TripImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      estimatedBudget: (json['estimatedBudget'] as num?)?.toDouble() ?? 0.0,
      distance: (json['distance'] as num?)?.toDouble() ?? 0.0,
      templeIds: (json['templeIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      dharamshalaIds: (json['dharamshalaIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      itinerary: (json['itinerary'] as List<dynamic>?)
              ?.map((e) => DayItinerary.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      status: json['status'] as String? ?? 'draft',
      isPublic: json['isPublic'] as bool? ?? false,
      shareLink: json['shareLink'] as String? ?? '',
      followers: (json['followers'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$TripImplToJson(_$TripImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'estimatedBudget': instance.estimatedBudget,
      'distance': instance.distance,
      'templeIds': instance.templeIds,
      'dharamshalaIds': instance.dharamshalaIds,
      'itinerary': instance.itinerary,
      'status': instance.status,
      'isPublic': instance.isPublic,
      'shareLink': instance.shareLink,
      'followers': instance.followers,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$DayItineraryImpl _$$DayItineraryImplFromJson(Map<String, dynamic> json) =>
    _$DayItineraryImpl(
      day: (json['day'] as num).toInt(),
      location: json['location'] as String,
      activities: (json['activities'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      notes: json['notes'] as String? ?? '',
      distance: (json['distance'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$DayItineraryImplToJson(_$DayItineraryImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'location': instance.location,
      'activities': instance.activities,
      'notes': instance.notes,
      'distance': instance.distance,
    };
