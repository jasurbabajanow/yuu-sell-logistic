import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static const String _accessTokenKey = 'access_token';
  static const String _userDataKey = 'user_data';

  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences get _preferences {
    if (_prefs == null) {
      throw Exception('TokenStorage not initialized. Call TokenStorage.init() first.');
    }
    return _prefs!;
  }

  // Access Token
  static Future<void> saveAccessToken(String token) async {
    await _preferences.setString(_accessTokenKey, token);
  }

  static String? getAccessToken() {
    return _preferences.getString(_accessTokenKey);
  }

  static Future<void> clearAccessToken() async {
    await _preferences.remove(_accessTokenKey);
  }

  // User Data
  static Future<void> saveUserData(Map<String, dynamic> userData) async {
    await _preferences.setString(_userDataKey, jsonEncode(userData));
  }

  static Map<String, dynamic>? getUserData() {
    final data = _preferences.getString(_userDataKey);
    if (data != null) {
      return jsonDecode(data) as Map<String, dynamic>;
    }
    return null;
  }

  static Future<void> clearUserData() async {
    await _preferences.remove(_userDataKey);
  }

  // Clear all auth data
  static Future<void> clearAll() async {
    await clearAccessToken();
    await clearUserData();
  }

  // Check if user is logged in
  static bool isLoggedIn() {
    final token = getAccessToken();
    return token != null && token.isNotEmpty;
  }
}
