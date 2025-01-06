import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/task.dart';
import '../utils/local_storage.dart';

class TaskService {
  static String baseUrl = "http://192.168.42.42:8060/task-pro/api/v1";

  // Charger les tâches de l'utilisateur
  static Future<List<Task>> getTasks() async {
    try {
      final url = Uri.parse("$baseUrl/users/tasks");
      final token = await LocalStorage.getToken();
      final response = await http.get(url, headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        List<Task> tasks = jsonResponse.map((task) => Task.fromJson(task)).toList();
        print(response.statusCode);
        return tasks;
      } else {
        throw Exception('Failed to load tasks');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to connect to server');
    }
  }

  // Ajouter une tâche
  static Future<bool> addTask(Map<String, dynamic> body) async {
    try {
      final url = Uri.parse("$baseUrl/users/add-task");
      final token = await LocalStorage.getToken();
      final response = await http.post(url, body: jsonEncode(body), headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Erreur d\'ajout de tâche : ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  // Modifier une tâche
  static Future<bool> updateTask(int id, Map<String, dynamic> body) async {
    try {
      final url = Uri.parse("$baseUrl/tasks/$id");
      final token = await LocalStorage.getToken();
      final response = await http.put(url, body: jsonEncode(body), headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Erreur de mise à jour de tâche : ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
