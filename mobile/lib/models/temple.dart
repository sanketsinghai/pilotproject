class Temple {
  final String id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final String description;
  final List<String> amenities;
  final String imageUrl;
  final double rating;
  final int reviews;

  Temple({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.description,
    this.amenities = const [],
    this.imageUrl = '',
    this.rating = 0.0,
    this.reviews = 0,
  });

  factory Temple.fromJson(Map<String, dynamic> json) {
    return Temple(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      latitude: json['latitude']?.toDouble() ?? 0.0,
      longitude: json['longitude']?.toDouble() ?? 0.0,
      description: json['description'] ?? '',
      amenities: List<String>.from(json['amenities'] ?? []),
      imageUrl: json['imageUrl'] ?? '',
      rating: json['rating']?.toDouble() ?? 0.0,
      reviews: json['reviews'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'description': description,
      'amenities': amenities,
      'imageUrl': imageUrl,
      'rating': rating,
      'reviews': reviews,
    };
  }
}
