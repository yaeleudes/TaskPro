import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';

class UserService {
  // static String baseUrl = "http://192.168.69.42:8081/task-pro/api/v1";
  static String baseUrl = "http://13.50.187.128:8081/task-pro/api/v1";

  static Future<bool> register(Map<String, dynamic> body) async {
    try {
      final url = Uri.parse("$baseUrl/users/inscription");
      final response = await http.post(url, body: jsonEncode(body), headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Erreur d\'inscription : ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  static Future<User?> login(Map<String, dynamic> body) async {
    try {
      final url = Uri.parse("$baseUrl/users/login");
      final response = await http.post(url, body: jsonEncode(body), headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        print('Erreur de connexion : ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
