import 'dart:convert';

import '../models/task.dart';
import 'package:http/http.dart' as http;

class TaskService {
  static String baseUrl = "http://10.55.23.86:8060/task-pro/api/v1/tasks/";

  static Future<List<Task>> getAllTask() async {
    try {
      final url = Uri.parse(baseUrl);
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((task) => Task.fromJson(task)).toList();
      } else {
        print('Erreur de chargment des tâches : ${response.statusCode}');
        throw Exception('Failed to load tasks');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to connect to server');
    }
  }
}
