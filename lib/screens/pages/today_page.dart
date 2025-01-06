import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:task_pro/models/task.dart';
import 'package:task_pro/widgets/task_list_tile.dart';

import '../../constants/task_pro_color.dart';
import '../../viewmodels/task_view_model.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({super.key});

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  List<Task>? tasks;
  
  List<Task> setTodayTasks(List<Task> tasks){
    return tasks.where(
      (task){
        print("${task.dateEnd} today");
        return ["En cours", "À faire"].contains(task.statut) && isSameDay(task.dateEnd, DateTime.now());
      }
    ).toList();
  }

  List<Task> setTodayTasksEnd(List<Task> tasks){
    return tasks.where(
      (task){
        return task.statut.toLowerCase().contains("Terminé".toLowerCase()) && isSameDay(task.dateEnd, DateTime.now());
      }
    ).toList();
  }

  List<Task> setTasksLate(List<Task> tasks){
    return tasks.where(
      (task){
        return ["En cours", "À faire"].contains(task.statut) && task.dateEnd.isBefore(DateTime.now());
      }
    ).toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final taskViewModel = Provider.of<TaskViewModel>(context, listen: false);
      taskViewModel.fetchTasks();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final taskViewModel = Provider.of<TaskViewModel>(context);

    if (taskViewModel.isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if(setTodayTasks(taskViewModel.tasks).isEmpty && Task.tasks.isEmpty){
      return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/home_image.png", width: size.width * .65,),
            const Text("Bonjour, yaelahodan", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
            Text("Aujourd'hui vous avez archévé ${setTodayTasksEnd(taskViewModel.tasks).length} tâche(s)"),
          ],
        ),
      );
    } else {
      return Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                if (setTasksLate(taskViewModel.tasks).isNotEmpty)
                  ExpansionTile(
                   childrenPadding: const EdgeInsets.only(bottom: 8, left: 10, right: 10),
                   shape: Border(bottom: BorderSide(color: TaskProColor.third)),
                   collapsedShape: Border(bottom: BorderSide(color: TaskProColor.third)),
                   title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       const Text("En retard"),
                       TextButton(onPressed: (){}, child: const Text("Reporter"))
                     ],
                   ),
                   children: setTasksLate(taskViewModel.tasks).map((task) {
                    print(isSameDay(task.dateEnd, DateTime.now()));
                     return TaskListTile(task: task);
                   }).toList(),
                  ),
                  
                ExpansionTile(
                  showTrailingIcon: false,
                  childrenPadding: const EdgeInsets.only(bottom: 8, left: 10, right: 10),
                  shape: Border(bottom: BorderSide(color: TaskProColor.third)),
                  collapsedShape: Border(bottom: BorderSide(color: TaskProColor.third)),
                  title: Text(DateFormat('dd MMM yyyy - EEEE', 'fr_FR').format(DateTime.now())),
                  children: setTodayTasks(taskViewModel.tasks).map((task) {
                    print(isSameDay(task.dateEnd, DateTime.now()));
                    return TaskListTile(task: task);
                  }).toList(),
                ),
              ],
            ),
          ), 
        ],
      );
    }
    
  }
}