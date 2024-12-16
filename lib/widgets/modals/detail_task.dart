import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../constants/task_pro_color.dart';
import '../../models/task.dart';

class DetailTask extends StatelessWidget {
  final Task task;
  const DetailTask({super.key, required this.task});

  Color statutColor() {
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

  @override
  Widget build(BuildContext context) {
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
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
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
                            onTap: (){
                              print("Tâche terminée!");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: priorityColor().withOpacity(.2),
                                borderRadius: BorderRadius.circular(100)
                              ),
                              child: HugeIcon(
                                icon: HugeIcons.strokeRoundedCircle,
                                color: priorityColor(),
                                size: 24.0,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            task.title, 
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                          Expanded(child: Text(task.description, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),)),
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
                          Expanded(child: Text(task.dateEnd, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),)),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Icon(Icons.flag_rounded, color: priorityColor(), size: 20,),
                          // HugeIcon(
                          //   icon: HugeIcons.strokeRoundedFlag02,
                          //   color: priorityColor(),
                          //   size: 20.0,
                          // ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(child: Text(task.priority, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),)),
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
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 4),
                            margin: const EdgeInsets.only(left: 4),
                            decoration: BoxDecoration(
                                color: statutColor(),
                                borderRadius: BorderRadius.circular(4)),
                            child: Text(
                              task.statut,
                              style: const TextStyle(fontSize: 14, color: Colors.white),
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
                          Expanded(child: Text(task.remind, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),)),
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