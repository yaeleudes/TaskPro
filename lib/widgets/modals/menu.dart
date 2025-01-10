import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task_pro/viewmodels/task_view_model.dart';
import 'package:task_pro/widgets/modals/modifier_tache.dart';

import '../../constants/task_pro_color.dart';
import '../../models/task.dart';
import '../../viewmodels/task_date_viewmodel.dart';
import '../messages/task_pro_message.dart';

class Menu extends StatefulWidget {
  final Task task;
  const Menu({super.key, required this.task});

  static Future<void> showModifierTacheModal(BuildContext context, Task task) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ModifierTache(task: task),
          ),
        );
      },
    );
  }

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Future<void> _updateTaskStatus(TaskViewModel taskViewModel, String newStatus, BuildContext context) async {
    final body = {
      "title": widget.task.title,
      "description": widget.task.description,
      "dateCreation": TaskDateViewmodel.formatDate(widget.task.dateCreation),
      "dateStart": TaskDateViewmodel.formatDate(widget.task.dateStart),
      "dateEnd": TaskDateViewmodel.formatDate(widget.task.dateEnd),
      "statut": newStatus,
      "priority": widget.task.priority,
      "rappel": widget.task.remind,
      "category": widget.task.category,
    };

    final success = await taskViewModel.updateTask(widget.task.taskId, body);
    if (success) Navigator.of(context).pop();
  }

  Future<void> _deleteTask(TaskViewModel taskViewModel, BuildContext context) async {
    final success = await taskViewModel.deleteTask(widget.task.taskId);
    if (!success) {
      TaskProMessage.showMessage(context, "Une erreur s'est produite...", color: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    final taskViewModel = Provider.of<TaskViewModel>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ajouté le ${DateFormat('dd MMM yyyy - EEEE', 'fr_FR').format(widget.task.dateCreation)}",
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            ),
            Divider(color: Colors.grey.shade200),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Menu.showModifierTacheModal(context, widget.task);
              },
              leading: const HugeIcon(
                icon: HugeIcons.strokeRoundedPencilEdit01,
                color: Colors.black,
                size: 24.0,
              ),
              title: const Text("Modifier la tâche"),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                _updateTaskStatus(taskViewModel, "Terminé", context);
              },
              leading: const HugeIcon(
                icon: HugeIcons.strokeRoundedCheckmarkCircle02,
                color: Colors.black,
                size: 24.0,
              ),
              title: const Text("Achever la tâche"),
            ),
            Divider(color: Colors.grey.shade200),
            ListTile(
              onTap: () async {
                final completer = Completer<bool>();
                bool isCanceled = false;

                Navigator.pop(context);
                TaskProMessage.showMessageAction(
                  context,
                  "Tâche supprimée avec succès!",
                  () {
                    isCanceled = true;
                    completer.complete(true);
                  },
                );

                await Future.any([
                  Future.delayed(const Duration(seconds: 5)),
                  completer.future,
                ]);

                if (!isCanceled) {
                  await _deleteTask(taskViewModel, context);
                }
              },
              leading: HugeIcon(
                icon: HugeIcons.strokeRoundedDelete02,
                color: TaskProColor.red,
                size: 24.0,
              ),
              title: Text(
                "Supprimer la tâche",
                style: TextStyle(color: TaskProColor.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
