import 'package:flutter/material.dart';
import 'package:task_pro/widgets/inputs/task_pro_research_input.dart';
import 'package:task_pro/widgets/task_list_tile.dart';

import '../../models/task.dart';

class RecherchePage extends StatefulWidget {
  const RecherchePage({super.key});

  @override
  State<RecherchePage> createState() => _RecherchePageState();
}

class _RecherchePageState extends State<RecherchePage> {
  TextEditingController researchController = TextEditingController();
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
  }

  void getResearchTask(String? value) {
    if (value!.isNotEmpty) {
      setState(() {
        tasks = Task.tasks.where((task) {
          bool byTitle = task.title.toLowerCase().contains(value.toLowerCase());
          bool byCategory = task.category.toLowerCase().contains(value.toLowerCase());
          return byTitle || byCategory;
        }).toList();
      });
    } else {
      setState(() {
        tasks.clear();
      });
    }
  }

  void clearController(){
    setState(() {
      researchController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                }
              )
            )
          else if(tasks.isEmpty && researchController.text.isNotEmpty)
            Expanded(
              child: Center(
                child: Text("Aucune correspondance pour \"${researchController.text}\"..."),
              ),
            )
          else
            Expanded(
              child: Center(
                child: Text("Aucune Tâche"),
              ),
            )          
        ],
      ),
    );
  }
}
