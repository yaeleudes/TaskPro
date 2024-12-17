import 'package:flutter/material.dart';
import 'package:task_pro/constants/task_pro_color.dart';
import 'package:task_pro/models/task.dart';

class ParcourirPage extends StatefulWidget {
  const ParcourirPage({super.key});

  @override
  State<ParcourirPage> createState() => _ParcourirPageState();
}

class _ParcourirPageState extends State<ParcourirPage> {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            onTap: (){},
            title: const Text("Terminé"),
            leading: Icon(Icons.check_circle_outline_rounded, color: TaskProColor.secondary,),
          ),
          ListTile(
            onTap: (){},
            title: const Text("En cours"),
            leading: Icon(Icons.arrow_circle_right_outlined, color: TaskProColor.secondary,),
          ),
          ListTile(
            onTap: (){},
            title: const Text("À faire"),
            leading: Icon(Icons.circle_outlined, color: TaskProColor.secondary,),
          ),
          ExpansionTile(
            title: const Text("Mes tâches", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            shape: const Border.symmetric(vertical: BorderSide.none, horizontal: BorderSide.none),
            childrenPadding: const EdgeInsets.only(left: 10, right: 10),
            children: [
              ListTile(
                onTap: (){},
                title: Row(children: [const Text('Personnel'), const SizedBox(width: 4,),Image.asset("assets/icons/perso.png", width: 20,)],),
                trailing:  Text("${Task.getListByCategory('Personnel').length}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
              ),
              ListTile(
                onTap: (){},
                title: Row(children: [const Text('Education'), const SizedBox(width: 4,),Image.asset("assets/icons/education.png", width: 20,)],),
                trailing: Text("${Task.getListByCategory('Education').length}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
              ),
              ListTile(
                onTap: (){},
                title: Row(children: [const Text('Travail'), const SizedBox(width: 4,),Image.asset("assets/icons/travail.png", width: 20,)],),
                trailing: Text("${Task.getListByCategory('Travail').length}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
              ),
              ListTile(
                onTap: (){},
                title: Row(children: [const Text('Santé'), const SizedBox(width: 4,),Image.asset("assets/icons/sante.png", width: 20,)],),
                trailing: Text("${Task.getListByCategory('Santé').length}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
              ),
              ListTile(
                onTap: (){},
                title: Row(children: [const Text('Autre'), const SizedBox(width: 4,),Image.asset("assets/icons/plus.png", width: 20,)],),
                trailing: Text("${Task.getListByCategory('Autre').length}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
              )
            ],
          )
        ],
      ),
    );
  }
}