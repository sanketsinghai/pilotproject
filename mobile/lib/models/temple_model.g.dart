// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temple_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TempleImpl _$$TempleImplFromJson(Map<String, dynamic> json) => _$TempleImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      state: json['state'] as String,
      city: json['city'] as String,
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      description: json['description'] as String? ?? '',
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      amenities: (json['amenities'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      phoneNumber: json['phoneNumber'] as String? ?? '',
      email: json['email'] as String? ?? '',
      website: json['website'] as String? ?? '',
      timings: json['timings'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: (json['reviewCount'] as num?)?.toInt() ?? 0,
      sect: json['sect'] as String? ?? '',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$TempleImplToJson(_$TempleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'state': instance.state,
      'city': instance.city,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'description': instance.description,
      'imageUrls': instance.imageUrls,
      'amenities': instance.amenities,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'website': instance.website,
      'timings': instance.timings,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'sect': instance.sect,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
