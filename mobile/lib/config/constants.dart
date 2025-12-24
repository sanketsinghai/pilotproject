class AppConstants {
  // API
  static const String apiBaseUrl = 'http://localhost:8000';
  static const String apiBaseUrlProduction = 'https://api.digamberjain.app';
  static const Duration apiTimeout = Duration(seconds: 30);

  // Firebase
  static const String firebaseProjectId = 'digamber-jain';

  // App
  static const String appName = 'Digamber Jain';
  static const String appVersion = '1.0.0';

  // Pagination
  static const int pageSize = 10;
  static const int maxPageSize = 100;

  // Cache
  static const Duration cacheExpiry = Duration(hours: 24);

  // Location
  static const double defaultLocationRadius = 50.0; // km
  static const int nearbyTempleCount = 10;

  // Age groups for Pathshala
  static const List<String> ageGroups = ['5-8', '9-12', '13-16', '17+'];

  // States
  static const List<String> indianStates = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
    'Delhi',
    'Ladakh',
    'Jammu & Kashmir',
  ];

  // Languages
  static const List<String> languages = [
    'English',
    'Hindi',
    'Gujarati',
    'Marathi',
    'Sanskrit',
  ];

  // Text lengths
  static const int minPasswordLength = 6;
  static const int maxSearchLength = 100;
  static const int maxReviewLength = 500;

  // Animation durations
  static const Duration shortDuration = Duration(milliseconds: 200);
  static const Duration mediumDuration = Duration(milliseconds: 400);
  static const Duration longDuration = Duration(milliseconds: 800);
}
