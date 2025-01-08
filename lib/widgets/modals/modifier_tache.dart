import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:task_pro/models/task.dart';
import 'package:task_pro/viewmodels/task_view_model.dart';

import '../../viewmodels/task_date_viewmodel.dart';
import '../buttons/task_pro_action_button.dart';
import '../inputs/task/add_task_description_input.dart';
import '../inputs/task/add_task_title_input.dart';

class ModifierTache extends StatefulWidget {
  final Task task;
  const ModifierTache({super.key, required this.task});

  @override
  State<ModifierTache> createState() => _ModifierTacheState();
}

class _ModifierTacheState extends State<ModifierTache> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void setTaskInfo() {
    setState(() {
      titleController.text = widget.task.title;
      descriptionController.text = widget.task.description;
    });
  }

  @override
  void initState() {
    super.initState();
    setTaskInfo();
  }

  @override
  Widget build(BuildContext context) {
    final taskViewModel = Provider.of<TaskViewModel>(context);
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (_, controller) {
        return SingleChildScrollView(
          controller: controller,
          child: SizedBox(
            // height: size.height * .62,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Form(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 10, top: 10, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Modifier la tâche",
                          style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const HugeIcon(
                              icon: HugeIcons.strokeRoundedMultiplicationSign,
                              color: Colors.black,
                              size: 24.0,
                            )),
                      ],
                    ),
                  ),

                  // Champs pour la création d'une tâche
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TaskTitleInput(
                          controller: titleController,
                          hintText: "Titre de la tâche",
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TaskDescription(
                          controller: descriptionController,
                          hintText: "Décrivez votre tâche ici",
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TaskProActionButton(
                          buttonTitle: "Enregistrer", 
                          onPressed: () async {
                            var body = {
                              "title": titleController.text,
                              "description": descriptionController.text,
                              "dateCreation": TaskDateViewmodel.formatDate(widget.task.dateCreation),
                              "dateStart": TaskDateViewmodel.formatDate(widget.task.dateStart),
                              "dateEnd": TaskDateViewmodel.formatDate(widget.task.dateEnd),
                              "statut": widget.task.statut,
                              "priority": widget.task.priority,
                              "rappel": widget.task.remind,
                              "category": widget.task.category
                            };
                            bool success = await taskViewModel.updateTask(widget.task.taskId, body);
                            if(success){
                              Navigator.of(context).pop();
                            }
                          }, 
                        )
                      ],
                    ),
                  )
                ],
              )),
            ),
          ),
        );
  
      },
    );
  }
}
