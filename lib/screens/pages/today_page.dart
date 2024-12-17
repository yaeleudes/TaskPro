import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_pro/models/task.dart';
import 'package:task_pro/widgets/task_list_tile.dart';

import '../../constants/task_pro_color.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({super.key});

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  
  List<Task> setTodayTasks(){
    return Task.tasks.where(
      (task){
        return ["En cours", "À faire"].contains(task.statut) && task.dateEnd == DateTime.now();
      }
    ).toList();
  }

  List<Task> setTodayTasksEnd(){
    return Task.tasks.where(
      (task){
        return task.statut.toLowerCase().contains("Terminé".toLowerCase()) && task.dateEnd == DateTime.now();
      }
    ).toList();
  }

  List<Task> setTodayTasksLate(){
    return Task.tasks.where(
      (task){
        return ["En cours", "À faire"].contains(task.statut) && task.dateEnd.isBefore(DateTime.now());
      }
    ).toList();
  }
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if(setTodayTasks().isEmpty && Task.tasks.isEmpty){
      return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/home_image.png", width: size.width * .65,),
            const Text("Bonjour, yaelahodan", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
            Text("Aujourd'hui vous avez archévé ${setTodayTasksEnd().length} tâche(s)"),
          ],
        ),
      );
    } else {
      return Column(
        children: [
          ExpansionTile(
           childrenPadding: const EdgeInsets.only(bottom: 8, left: 10, right: 10),
           shape: Border(bottom: BorderSide(color: TaskProColor.third)),
           collapsedShape: Border(bottom: BorderSide(color: TaskProColor.third)),
           title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               const Text("En retard"),
               TextButton(onPressed: (){}, child: Text("Reporter"))
             ],
           ),
           children: setTodayTasksLate().map((task) {
             return TaskListTile(task: task);
           }).toList(),
          ),

          ExpansionTile(
            showTrailingIcon: false,
            childrenPadding: const EdgeInsets.only(bottom: 8, left: 10, right: 10),
            shape: Border(bottom: BorderSide(color: TaskProColor.third)),
            collapsedShape: Border(bottom: BorderSide(color: TaskProColor.third)),
            title: Text(DateFormat('dd MMM yyyy - EEEE', 'fr_FR').format(DateTime.now())),
            children: setTodayTasks().map((task) {
              return TaskListTile(task: task);
            }).toList(),
          ),
            
        ],
      );
    }
    
  }
}