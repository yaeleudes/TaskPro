import 'package:flutter/material.dart';
import 'package:task_pro/models/task.dart';

import '../../widgets/task_list_tile.dart';

class ParcourirTache extends StatelessWidget {
  final String title;
  final List<Task> tasks;
  const ParcourirTache({super.key, required this.tasks, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return TaskListTile(task: task);
        }
      ),
    );
  }
}
