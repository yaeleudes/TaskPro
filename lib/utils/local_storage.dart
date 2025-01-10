import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/user.dart';

class LocalStorage {
  static const String _userKey = 'user';
  static const String _tokenKey = 'token';
  static const String _timestampKey = 'timestamp';

  static Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_userKey, jsonEncode(user.toJson()));
  }

  static Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userKey);
    if (userJson != null) {
      return User.fromJson(jsonDecode(userJson));
    }
    return null;
  }

  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_tokenKey, token);
    prefs.setInt(_timestampKey, DateTime.now().millisecondsSinceEpoch);
  }


  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<int?> getTimestamp() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_timestampKey);
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_userKey);
    prefs.remove(_tokenKey);
    prefs.remove(_timestampKey);
  }
}
