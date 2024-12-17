import 'package:flutter/material.dart';
import 'package:task_pro/models/task.dart';
import 'package:task_pro/widgets/task_list_tile.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({super.key});

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  
  List<Task> setTodayTasks(){
    return Task.tasks.where(
      (task){
        return ["En cours", "À faire"].contains(task.statut);
      }
    ).toList();
  }
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if(setTodayTasks().isEmpty){
      return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/home_image.png", width: size.width * .65,),
            const Text("Bonjour, yaelahodan", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
            const Text("Aujourd'hui vous avez archévé 0 tâche(s)"),
          ],
        ),
      );
    } else {
      return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: setTodayTasks().length,
        itemBuilder: (context, index){
          final task = setTodayTasks()[index];
          return TaskListTile(task: task,);
        }
      );
    }
    
  }
}