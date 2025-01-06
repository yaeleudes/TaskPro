import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';
import '../utils/local_storage.dart';

class AuthService {
  static String baseUrl = "http://192.168.42.42:8060/task-pro/api/v1";

  static Future<Map<String, dynamic>> login(Map<String, dynamic> body) async {
    try {
      final url = Uri.parse("$baseUrl/users/connexion");
      final response = await http.post(url, body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
      var data = jsonDecode(response.body);
      String erreur = data['error'] ?? '';

      if (response.statusCode == 200) {
        
        User user = User.fromJson(data['user']);
        String token = data['bearer'];
        

        // Store user and token locally
        await LocalStorage.saveUser(user);
        await LocalStorage.saveToken(token);

        return {
          'status' : true,
          'user': user,
          'message': 'Succès'
        };
      } else {
        print('Erreur de connexion : ${response.statusCode}');
        print(erreur);
        return {
          'status' : false,
          'user': '',
          'message': erreur
        };
      }
    } catch (e) {
      print('Error: $e');
      return {
        'status' : false,
        'user': '',
        'message': 'Échec'
      };
    }
  }


  static Future<Map<String, dynamic>> register(Map<String, dynamic> body) async {
    try {
      final url = Uri.parse("$baseUrl/users/inscription");
      final response = await http.post(url, body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
      var data = jsonDecode(response.body);
      String erreur = data['error'] ?? '';

      if (response.statusCode == 200) {
        return {
          'status' : true,
          'message': 'Succès'
        };
      } else {
        print('Erreur d\'inscription : ${response.statusCode}');
        print(erreur);
        return {
          'status' : false,
          'message': utf8.decode(erreur.runes.toList())
        };
      }
    } catch (e) {
      print('Error: $e');
      return {
          'status' : false,
          'message': 'Échec'
        };
    }
  }
}
