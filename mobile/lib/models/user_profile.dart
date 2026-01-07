class UserProfile {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String profileImageUrl;
  final String bio;
  final DateTime joinedDate;
  final List<String> bookmarkedTemples;
  final List<String> bookmarkedTrips;
  final int totalTripsCompleted;
  final bool isVerified;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    this.phone = '',
    this.profileImageUrl = '',
    this.bio = '',
    required this.joinedDate,
    this.bookmarkedTemples = const [],
    this.bookmarkedTrips = const [],
    this.totalTripsCompleted = 0,
    this.isVerified = false,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      profileImageUrl: json['profileImageUrl'] ?? '',
      bio: json['bio'] ?? '',
      joinedDate: DateTime.parse(json['joinedDate'] ?? DateTime.now().toString()),
      bookmarkedTemples: List<String>.from(json['bookmarkedTemples'] ?? []),
      bookmarkedTrips: List<String>.from(json['bookmarkedTrips'] ?? []),
      totalTripsCompleted: json['totalTripsCompleted'] ?? 0,
      isVerified: json['isVerified'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'profileImageUrl': profileImageUrl,
      'bio': bio,
      'joinedDate': joinedDate.toIso8601String(),
      'bookmarkedTemples': bookmarkedTemples,
      'bookmarkedTrips': bookmarkedTrips,
      'totalTripsCompleted': totalTripsCompleted,
      'isVerified': isVerified,
    };
  }
}
