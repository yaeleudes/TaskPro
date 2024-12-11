import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../constants/task_pro_color.dart';

class TaskPriorityPickle extends StatefulWidget {
  final String? priorityValue;
  final Function(String?) onSelected;
  const TaskPriorityPickle({super.key, required this.onSelected, required this.priorityValue});

  @override
  State<TaskPriorityPickle> createState() => _TaskPriorityPickleState();
}

class _TaskPriorityPickleState extends State<TaskPriorityPickle> {

  Color priorityColor(){
    if(widget.priorityValue == "Faible"){
      return TaskProColor.blue.withOpacity(.7);
    } else if(widget.priorityValue == "Moyen"){
      return TaskProColor.yellow.withOpacity(.7);
    } else if(widget.priorityValue == "Élevé"){
      return TaskProColor.red.withOpacity(.7);
    }
    return Colors.black.withOpacity(.7);
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      child: SizedBox(
        width: size.width * .24,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(6),
              ),
              child: PopupMenuButton<String>(
                onSelected: widget.onSelected,
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: "Faible",
                    child: Container(child: Row(children: [Icon(Icons.flag_rounded, color: TaskProColor.blue,), const SizedBox(width: 6,), const Text('Faible'), ],),),
                  ),
                  PopupMenuItem(
                    value: "Moyen",
                    child: Container(child: Row(children: [Icon(Icons.flag_rounded, color: TaskProColor.yellow,), const SizedBox(width: 6,), const Text('Moyen'), ],),),
                  ),
                  PopupMenuItem(
                    value: "Élevé",
                    child: Container(child: Row(children: [Icon(Icons.flag_rounded, color: TaskProColor.red,), const SizedBox(width: 6,), const Text('Élevé'), ],),),
                  ),
                ],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if(widget.priorityValue == "Faible")
                      Icon(Icons.flag_rounded, color: TaskProColor.blue, size: 18.0,)
                    
                    else if (widget.priorityValue == "Moyen")
                      Icon(Icons.flag_rounded, color: TaskProColor.yellow, size: 18.0,)

                    else if (widget.priorityValue == "Élevé")
                      Icon(Icons.flag_rounded, color: TaskProColor.red, size: 18.0,)
                    
                    else
                      const HugeIcon(
                        icon: HugeIcons.strokeRoundedFlag02,
                        color: Colors.black,
                        size: 18.0,
                      ),
                    
                    const SizedBox(width: 4),
                    Text(
                      widget.priorityValue!,
                      style: TextStyle(
                        color: priorityColor(),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
