import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:task_pro/widgets/modals/modifier_tache.dart';

import '../../constants/task_pro_color.dart';
import '../../models/task.dart';

class Menu extends StatelessWidget {
  final Task task;
  const Menu({super.key, required this.task});

  static Future modifierTache(BuildContext context, Task task) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ModifierTache(task: task);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Ajouté le ${DateFormat('dd MMM yyyy - EEEE', 'fr_FR').format(task.dateCreation)}", style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),),
              Divider(color: Colors.grey.shade200,),
              ListTile(
                onTap: (){
                  Navigator.pop(context);
                  modifierTache(context, task);
                },
                leading: const HugeIcon(
                  icon: HugeIcons.strokeRoundedPencilEdit01,
                  color: Colors.black,
                  size: 24.0,
                ),
                title: const Text("Modifier la tâche"),
              ),
              ListTile(
                onTap: (){},
                leading: const HugeIcon(
                  icon: HugeIcons.strokeRoundedCheckmarkCircle02,
                  color: Colors.black,
                  size: 24.0,
                ),
                title: const Text("Achever la tâche"),
              ),
              Divider(color: Colors.grey.shade200,),
              ListTile(
                onTap: (){},
                leading: HugeIcon(
                  icon: HugeIcons.strokeRoundedDelete02,
                  color: TaskProColor.red,
                  size: 24.0,
                ),
                title: Text("Supprimer la tâche", style: TextStyle(color: TaskProColor.red),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
