import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_pro/widgets/inputs/task_pro_research_input.dart';
import 'package:task_pro/widgets/task_list_tile.dart';

import '../../models/task.dart';
import '../../viewmodels/task_view_model.dart';

class RecherchePage extends StatefulWidget {
  const RecherchePage({super.key});

  @override
  State<RecherchePage> createState() => _RecherchePageState();
}

class _RecherchePageState extends State<RecherchePage> {
  TextEditingController researchController = TextEditingController();
  List<Task> tasks = [];
  TaskViewModel taskViewModel = TaskViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      taskViewModel = Provider.of<TaskViewModel>(context, listen: false);
      taskViewModel.fetchTasks();
    });
  }

  void getResearchTask(String? value) {
    final listTasks = taskViewModel.tasks;

    setState(() {
      if (value != null && value.isNotEmpty) {
        tasks = listTasks.where((task) {
          final searchValue = value.toLowerCase();
          return task.title.toLowerCase().contains(searchValue) || 
          task.category.toLowerCase().contains(searchValue) || 
          task.statut.toLowerCase().contains(searchValue);
        }).toList();
      } else {
        tasks = [];
      }
    });
  }

  void clearController() {
    setState(() {
      researchController.clear();
      tasks = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final taskViewModel = Provider.of<TaskViewModel>(context);
    if (taskViewModel.isLoading) {
      clearController();
      return const Center(child: CircularProgressIndicator());
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TaskProResearchInput(
              controller: researchController,
              hintText: "tâches, catégories, date et plus",
              onChanged: getResearchTask,
              clear: clearController,
            ),
          ),
          if (tasks.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return TaskListTile(task: task);
                },
              ),
            )
          else
            Expanded(
              child: Center(
                child: Text(
                  researchController.text.isNotEmpty
                      ? "Aucune correspondance pour \"${researchController.text}\"..."
                      : "Aucune Tâche",
                ),
              ),
            ),
        ],
      ),
    );
  }
}
