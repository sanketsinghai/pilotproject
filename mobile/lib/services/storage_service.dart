import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class StorageService {
  static const String _templeKey = 'temples';
  static const String _tripKey = 'trips';
  static const String _userKey = 'user_data';
  static const String _favoritesKey = 'favorites';

  static Future<void> saveTemples(List<Map<String, dynamic>> temples) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_templeKey, jsonEncode(temples));
  }

  static Future<List<Map<String, dynamic>>> getTemples() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_templeKey);
    if (data == null) return [];
    return List<Map<String, dynamic>>.from(jsonDecode(data));
  }

  static Future<void> saveTrips(List<Map<String, dynamic>> trips) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tripKey, jsonEncode(trips));
  }

  static Future<List<Map<String, dynamic>>> getTrips() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_tripKey);
    if (data == null) return [];
    return List<Map<String, dynamic>>.from(jsonDecode(data));
  }

  static Future<void> saveFavorites(List<String> favoriteIds) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_favoritesKey, favoriteIds);
  }

  static Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoritesKey) ?? [];
  }

  static Future<void> addFavorite(String id) async {
    final favorites = await getFavorites();
    if (!favorites.contains(id)) {
      favorites.add(id);
      await saveFavorites(favorites);
    }
  }

  static Future<void> removeFavorite(String id) async {
    final favorites = await getFavorites();
    favorites.remove(id);
    await saveFavorites(favorites);
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
