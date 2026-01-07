import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static const String _isLoggedInKey = 'is_logged_in';
  static const String _userIdKey = 'user_id';
  static const String _userEmailKey = 'user_email';
  static const String _userNameKey = 'user_name';

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  static Future<void> login(String email, String name, String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await Future.wait([
      prefs.setBool(_isLoggedInKey, true),
      prefs.setString(_userIdKey, userId),
      prefs.setString(_userEmailKey, email),
      prefs.setString(_userNameKey, name),
    ]);
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userIdKey);
  }

  static Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userEmailKey);
  }

  static Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userNameKey);
  }
}
