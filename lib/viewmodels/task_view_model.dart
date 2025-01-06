import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/task_service.dart';

class TaskViewModel extends ChangeNotifier {
  List<Task> _tasks = [];
  bool _isLoading = false;

  List<Task> get tasks => _tasks;
  bool get isLoading => _isLoading;

  Future<void> fetchTasks() async {
    _isLoading = true;
    notifyListeners();

    try {
      _tasks = await TaskService.getTasks();
      print(_tasks.length);
    } catch (e) {
      print("Hello");
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchTodayTasks() async {
    _isLoading = true;
    notifyListeners();

    try {
      _tasks = await TaskService.getTasks();
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> addTask(Map<String, dynamic> body) async {
    _isLoading = true;
    notifyListeners();

    try {
      bool success = await TaskService.addTask(body);
      if (success) {
        await fetchTasks();
      }
      return success;
    } catch (e) {
      // Handle error
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> updateTask(int id, Map<String, dynamic> body) async {
    _isLoading = true;
    notifyListeners();

    try {
      bool success = await TaskService.updateTask(id, body);
      if (success) {
        await fetchTasks();
      }
      return success;
    } catch (e) {
      // Handle error
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
