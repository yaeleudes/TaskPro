import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/task.dart';
import '../services/task_service.dart';

class TaskViewModel extends ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> _categoryTasks = [];
  bool _isLoading = false;
  int _endedTasks = 0;
  int _todoTask = 0;
  int _notDoneTask = 0;

  List<Task> get tasks => _tasks;
  List<Task> get categoryTasks => _categoryTasks;
  bool get isLoading => _isLoading;
  int get endedTask => _endedTasks;
  int get todoTask => _todoTask;
  int get notDoneTask => _notDoneTask;

  Future<void> fetchTasks() async {
    _isLoading = true;
    notifyListeners();

    try {
      _tasks = await TaskService.getTasks();
      // notifyListeners();
      // print(_tasks.length);
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Future<void> getCountTask() async {
  //   _isLoading = true;
  //   notifyListeners();

  //   try {
  //     _tasks = await TaskService.getTasks();
  //     _endedTasks = _tasks.where((task) => ["Terminé"].contains(task.statut)).toList().length;
  //     _todoTask = _tasks.where((task) => ["À faire"].contains(task.statut)).toList().length;
  //     _notDoneTask = _tasks.where((task) => ["En cours"].contains(task.statut)).toList().length;
  //     // notifyListeners();
  //   } catch (e) {
  //     print(e);
  //   } finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }

  // Future<void> fetchTodayTasks() async {
  //   _isLoading = true;
  //   notifyListeners();
  //   try {
  //     List<Task> listTask = await TaskService.getTasks();
  //     _tasks = listTask.where(
  //       (task){
  //         return ["En cours", "À faire"].contains(task.statut) && isSameDay(task.dateEnd, DateTime.now());
  //       }
  //     ).toList();
  //     // notifyListeners();
  //   } catch (e) {
  //     // Handle error
  //     print(e);
  //   } finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }

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
      // notifyListeners();
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

  List<Task> getListByCategory(String value) {
    _isLoading = true;
    // notifyListeners();
    try {
      return _tasks.where((task) => task.category.toLowerCase().contains(value.toLowerCase())).toList();
    } catch (e) {
      return [];
    } finally {
      _isLoading = false;
      // notifyListeners();
    }
  }
  List<Task> getListByStatus(String value) {
    _isLoading = true;
    notifyListeners();
    try {
      return _tasks.where((task) => task.statut.toLowerCase().contains(value.toLowerCase())).toList();
    } catch (e) {
      return [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
