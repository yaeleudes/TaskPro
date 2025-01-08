import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:task_pro/viewmodels/task_date_viewmodel.dart';

import '../../constants/task_pro_color.dart';
import '../../models/task.dart';
import '../../viewmodels/task_view_model.dart';
import 'menu.dart';

class DetailTask extends StatelessWidget {
  final Task task;
  const DetailTask({super.key, required this.task});

  Color statutColor() {
    if (task.statut == "À faire") {
      return TaskProColor.red.withOpacity(.3);
    } else if (task.statut == "En cours") {
      return TaskProColor.yellow.withOpacity(.3);
    } else {
      return TaskProColor.green.withOpacity(.3);
    }
  }

  Color statutTextColor() {
    if (task.statut == "À faire") {
      return TaskProColor.red;
    } else if (task.statut == "En cours") {
      return TaskProColor.yellow;
    } else {
      return TaskProColor.green;
    }
  }

  Color priorityColor(){
    if(task.priority == "Faible"){
      return TaskProColor.blue;
    } else if(task.priority == "Moyenne"){
      return TaskProColor.yellow;
    } else if(task.priority == "Élevée"){
      return TaskProColor.red;
    } else {
      return Colors.black;
    }
  }

  String iconCategory() {
    if (task.category == "Personnel") {
      return "assets/icons/perso.png";
    } else if (task.category == "Travail") {
      return "assets/icons/travail.png";
    } else if(task.category == "Santé"){
      return "assets/icons/sante.png";
    } else if(task.category == "Education") {
      return "assets/icons/education.png";
    } else {
      return "assets/icons/plus.png";
    }
  }

  void showMenu(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: true,
        builder: (BuildContext context) {
          return Menu(task: task);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    final taskViewModel = Provider.of<TaskViewModel>(context); 

    return SingleChildScrollView(
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          task.category,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Image.asset(
                          iconCategory(),
                          width: 20,
                        )
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        showMenu(context);
                      },
                      icon: const HugeIcon(
                        icon: HugeIcons.strokeRoundedMoreVertical,
                        color: Colors.black,
                        size: 24.0,
                      )
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              var body = {
                                "title": task.title,
                                "description": task.description,
                                "dateCreation": TaskDateViewmodel.formatDate(task.dateCreation),
                                "dateStart": TaskDateViewmodel.formatDate(task.dateStart),
                                "dateEnd": TaskDateViewmodel.formatDate(task.dateEnd),
                                "statut": "Terminé",
                                "priority": task.priority,
                                "rappel": task.remind,
                                "category": task.category
                              };
                              bool success = await taskViewModel.updateTask(task.taskId, body);
                              if(success){
                                Navigator.of(context).pop();
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: task.statut != "Terminé"? priorityColor().withOpacity(.2) : TaskProColor.green.withOpacity(.2),
                                borderRadius: BorderRadius.circular(100)
                              ),
                              child: HugeIcon(
                                icon: HugeIcons.strokeRoundedCircle,
                                color: task.statut != "Terminé"? priorityColor() : TaskProColor.green,
                                size: 24.0,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            task.title, 
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const HugeIcon(
                            icon: HugeIcons.strokeRoundedTextAlignLeft,
                            color: Colors.black,
                            size: 20.0,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(child: Text(task.description, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),)),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          const HugeIcon(
                            icon: HugeIcons.strokeRoundedCalendar02,
                            color: Colors.black,
                            size: 20.0,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(child: Text(TaskDateViewmodel.getSelectedDateD(task.dateEnd), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),)),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Icon(Icons.flag_rounded, color: priorityColor(), size: 20,),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(child: Text(task.priority, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),)),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          const HugeIcon(
                            icon: HugeIcons.strokeRoundedTag01,
                            color: Colors.black,
                            size: 20.0,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                              decoration: BoxDecoration(color: statutColor(), borderRadius: BorderRadius.circular(4)),
                              child: PopupMenuButton<String>(
                                onSelected: (value) async {
                                  var body = {
                                    "title": task.title,
                                    "description": task.description,
                                    "dateCreation": TaskDateViewmodel.formatDate(task.dateCreation),
                                    "dateStart": TaskDateViewmodel.formatDate(task.dateStart),
                                    "dateEnd": TaskDateViewmodel.formatDate(task.dateEnd),
                                    "statut": value,
                                    "priority": task.priority,
                                    "rappel": task.remind,
                                    "category": task.category
                                  };
                                  print(value);
                                  bool success = await taskViewModel.updateTask(task.taskId, body);
                                  if(success){
                                    Navigator.of(context).pop();
                                  }
                                },
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: "À faire",
                                    child: Container(padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4), child: Text("À faire", selectionColor: TaskProColor.red.withOpacity(.3),),),
                                  ),
                                  PopupMenuItem(
                                    value: "En cours",
                                    child: Container(padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4), child:  Text('En cours', selectionColor: TaskProColor.yellow.withOpacity(.3),),),
                                  ),
                                  PopupMenuItem(
                                    value: "Terminé",
                                    child: Container(padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4), child:  Text('Terminé', selectionColor: TaskProColor.green.withOpacity(.3),),),
                                  ),
                                ],
                                child: Text(
                                  task.statut,
                                  style: TextStyle(fontSize: 14, color: statutTextColor(), fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          const HugeIcon(
                            icon: HugeIcons.strokeRoundedAlarmClock,
                            color: Colors.black,
                            size: 20.0,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(child: Text(task.remind, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),)),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );        
  }
}