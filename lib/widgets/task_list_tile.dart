import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:task_pro/constants/task_pro_color.dart';
import 'package:task_pro/viewmodels/task_date_viewmodel.dart';

import '../models/task.dart';
import 'modals/detail_task.dart';

class TaskListTile extends StatelessWidget {
  final Task task;
  const TaskListTile({super.key, required this.task});

  Color statutColor() {
    if (task.statut == "À faire") {
      return TaskProColor.red.withOpacity(.4);
    } else if (task.statut == "En cours") {
      return TaskProColor.yellow.withOpacity(.4);
    } else {
      return TaskProColor.green.withOpacity(.4);
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
  

  String iconCategory() {
    if (task.category == "Personnel") {
      return "assets/icons/perso.png";
    } else if (task.category == "Travail") {
      return "assets/icons/travail.png";
    } else if (task.category == "Santé") {
      return "assets/icons/sante.png";
    } else if (task.category == "Education") {
      return "assets/icons/education.png";
    } else {
      return "assets/icons/plus.png";
    }
  }

  void showDetailTask(BuildContext context, Task task) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: true,
        builder: (BuildContext context) {
          return DetailTask(task: task);
        }
    );
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

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: TaskProColor.third),
          borderRadius: BorderRadius.circular(6)),
      child: ListTile(
        onTap: () {
          showDetailTask(context, task);
        },
        onLongPress: (){},
        title: Row(
          children: [
            GestureDetector(
              onTap: (){
                task.changeStatusToEnd();
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
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (task.description.isNotEmpty)
              Text(
                task.description,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
              ),
            Container(
              margin: const EdgeInsets.only(top: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const HugeIcon(
                        icon: HugeIcons.strokeRoundedCalendar02,
                        color: Colors.black,
                        size: 14.0,
                      ),
                      Text(
                        "${TaskDateViewmodel.getSelectedDateD(task.dateEnd)} ${task.dateEnd.hour}:${task.dateEnd.minute}",
                        style: const TextStyle(fontSize: 14),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 4),
                        margin: const EdgeInsets.only(left: 4),
                        decoration: BoxDecoration(
                            color: statutColor(),
                            borderRadius: BorderRadius.circular(4)),
                        child: Text(
                          task.statut,
                          style: TextStyle(fontSize: 14, color: statutTextColor(), fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        task.category,
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Image.asset(
                        iconCategory(),
                        width: 20,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
