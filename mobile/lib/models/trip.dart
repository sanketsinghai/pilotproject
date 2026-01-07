class Trip {
  final String id;
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final List<String> destinations;
  final double estimatedCost;
  final String difficulty;
  final int maxParticipants;
  final int currentParticipants;
  final String guide;
  final List<String> itinerary;
  final bool isBooked;

  Trip({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    this.destinations = const [],
    this.estimatedCost = 0.0,
    this.difficulty = 'Medium',
    this.maxParticipants = 0,
    this.currentParticipants = 0,
    this.guide = '',
    this.itinerary = const [],
    this.isBooked = false,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      startDate: DateTime.parse(json['startDate'] ?? DateTime.now().toString()),
      endDate: DateTime.parse(json['endDate'] ?? DateTime.now().toString()),
      destinations: List<String>.from(json['destinations'] ?? []),
      estimatedCost: json['estimatedCost']?.toDouble() ?? 0.0,
      difficulty: json['difficulty'] ?? 'Medium',
      maxParticipants: json['maxParticipants'] ?? 0,
      currentParticipants: json['currentParticipants'] ?? 0,
      guide: json['guide'] ?? '',
      itinerary: List<String>.from(json['itinerary'] ?? []),
      isBooked: json['isBooked'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'destinations': destinations,
      'estimatedCost': estimatedCost,
      'difficulty': difficulty,
      'maxParticipants': maxParticipants,
      'currentParticipants': currentParticipants,
      'guide': guide,
      'itinerary': itinerary,
      'isBooked': isBooked,
    };
  }
}
