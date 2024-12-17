import '../models/task.dart';

class TaskViewmodel {
  static List<Task> searchTask(String? value) {
    return Task.tasks.where((task) {
      bool byTitle = task.title.contains(value!);
      bool byCategory = task.category.contains(value);
      return byTitle || byCategory;
    }).toList();
  }
}
