// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dharamshala_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DharamshalaImpl _$$DharamshalaImplFromJson(Map<String, dynamic> json) =>
    _$DharamshalaImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      state: json['state'] as String,
      city: json['city'] as String,
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      description: json['description'] as String? ?? '',
      totalRooms: (json['totalRooms'] as num?)?.toInt() ?? 0,
      availableRooms: (json['availableRooms'] as num?)?.toInt() ?? 0,
      costPerNight: (json['costPerNight'] as num?)?.toDouble() ?? 0.0,
      amenities: (json['amenities'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      phoneNumber: json['phoneNumber'] as String? ?? '',
      email: json['email'] as String? ?? '',
      contactPerson: json['contactPerson'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: (json['reviewCount'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$DharamshalaImplToJson(_$DharamshalaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'state': instance.state,
      'city': instance.city,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'description': instance.description,
      'totalRooms': instance.totalRooms,
      'availableRooms': instance.availableRooms,
      'costPerNight': instance.costPerNight,
      'amenities': instance.amenities,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'contactPerson': instance.contactPerson,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
