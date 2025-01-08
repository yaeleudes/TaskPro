import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
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
      List<Task> listTask = await TaskService.getTasks();
      _tasks = listTask.where(
        (task){
          return ["En cours", "À faire"].contains(task.statut) && isSameDay(task.dateEnd, DateTime.now());
        }
      ).toList();
    } catch (e) {
      // Handle error
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchNotEndTasks() async {
    _isLoading = true;
    notifyListeners();
    try {
      List<Task> listTask = await TaskService.getTasks();
      _tasks = listTask.where(
        (task){
          return ["En cours", "À faire"].contains(task.statut);
        }
      ).toList();
    } catch (e) {
      // Handle error
      print(e);
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
      print(e);
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

  Future<bool> deleteTask(int id) async {
    _isLoading = true;
    notifyListeners();

    try {
      bool success = await TaskService.deleteTask(id);
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
