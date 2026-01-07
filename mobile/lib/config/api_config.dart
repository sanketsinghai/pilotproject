const String apiBaseUrl = 'http://localhost:8000/api';

class ApiEndpoints {
  // Temples
  static const String temples = '$apiBaseUrl/temples';
  static String templeById(String id) => '$apiBaseUrl/temples/$id';

  // Sacred Texts
  static const String texts = '$apiBaseUrl/granths';
  static String textById(String id) => '$apiBaseUrl/granths/$id';

  // Trips
  static const String trips = '$apiBaseUrl/trips';
  static String tripById(String id) => '$apiBaseUrl/trips/$id';

  // Lessons
  static const String lessons = '$apiBaseUrl/lessons';
  static String lessonById(String id) => '$apiBaseUrl/lessons/$id';

  // Auth
  static const String login = '$apiBaseUrl/auth/login';
  static const String register = '$apiBaseUrl/auth/register';
  static const String logout = '$apiBaseUrl/auth/logout';
}

class ApiConfig {
  static const Duration timeout = Duration(seconds: 30);
  static const int maxRetries = 3;
  static const bool enableLogging = true;
}
