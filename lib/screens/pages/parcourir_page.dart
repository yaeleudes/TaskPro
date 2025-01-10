import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_pro/constants/task_pro_color.dart';

import '../../viewmodels/task_view_model.dart';
import 'parcourir_tache.dart';

class ParcourirPage extends StatefulWidget {
  const ParcourirPage({super.key});

  @override
  State<ParcourirPage> createState() => _ParcourirPageState();
}

class _ParcourirPageState extends State<ParcourirPage> {
  TaskViewModel taskViewModel = TaskViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      taskViewModel = Provider.of<TaskViewModel>(context, listen: false);
      taskViewModel.fetchTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final taskViewModel = Provider.of<TaskViewModel>(context);
    if (taskViewModel.isLoading) {
     return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ParcourirTache(title: "Terminé", tasks: taskViewModel.getListByStatus("Terminé"),)));
            },
            title: const Text("Terminé"),
            leading: Icon(Icons.check_circle_outline_rounded, color: TaskProColor.secondary,),
            trailing: Text("${taskViewModel.tasks.where((task) => ["Terminé"].contains(task.statut)).toList().length}", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ParcourirTache(title: "En cours", tasks: taskViewModel.getListByStatus("En cours"),)));
            },
            title: const Text("En cours"),
            leading: Icon(Icons.arrow_circle_right_outlined, color: TaskProColor.secondary,),
            trailing: Text("${taskViewModel.tasks.where((task) => ["En cours"].contains(task.statut)).toList().length}", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ParcourirTache(title: "À faire", tasks: taskViewModel.getListByStatus("À faire"),)));
            },
            title: const Text("À faire"),
            leading: Icon(Icons.circle_outlined, color: TaskProColor.secondary,),
            trailing: Text("${taskViewModel.tasks.where((task) => ["À faire"].contains(task.statut)).toList().length}", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
          ),
          ExpansionTile(
            title: const Text("Mes tâches", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            shape: const Border.symmetric(vertical: BorderSide.none, horizontal: BorderSide.none),
            childrenPadding: const EdgeInsets.only(left: 10, right: 10),
            children: [
              ListTile(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ParcourirTache(title: 'Personnel', tasks: taskViewModel.getListByCategory('Personnel'),)));},
                title: Row(children: [const Text('Personnel'), const SizedBox(width: 4,),Image.asset("assets/icons/perso.png", width: 20,)],),
                trailing:  Text("${taskViewModel.getListByCategory('Personnel').length}", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
              ),
              ListTile(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ParcourirTache(title: 'Education', tasks: taskViewModel.getListByCategory('Education'),)));},
                title: Row(children: [const Text('Education'), const SizedBox(width: 4,),Image.asset("assets/icons/education.png", width: 20,)],),
                trailing: Text("${taskViewModel.getListByCategory('Education').length}", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
              ),
              ListTile(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ParcourirTache(title: 'Travail', tasks: taskViewModel.getListByCategory('Travail'),)));},
                title: Row(children: [const Text('Travail'), const SizedBox(width: 4,),Image.asset("assets/icons/travail.png", width: 20,)],),
                trailing: Text("${taskViewModel.getListByCategory('Travail').length}", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
              ),
              ListTile(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ParcourirTache(title: 'Santé', tasks: taskViewModel.getListByCategory('Santé'),)));},
                title: Row(children: [const Text('Santé'), const SizedBox(width: 4,),Image.asset("assets/icons/sante.png", width: 20,)],),
                trailing: Text("${taskViewModel.getListByCategory('Santé').length}", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
              ),
              ListTile(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ParcourirTache(title: 'Autre', tasks: taskViewModel.getListByCategory('Autre'),)));},
                title: Row(children: [const Text('Autre'), const SizedBox(width: 4,),Image.asset("assets/icons/plus.png", width: 20,)],),
                trailing: Text("${taskViewModel.getListByCategory('Autre').length}", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
              )
            ],
          )
        ],
      ),
    );
  }
}