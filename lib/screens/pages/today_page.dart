import 'package:flutter/material.dart';
import 'package:task_pro/models/task.dart';
import 'package:task_pro/widgets/task_list_tile.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({super.key});

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  final List<Task> _tasks = [
    Task(
      taskId: 1,
      title: "Réunion d'équipe",
      description: "Discuter des progrès du projet et des prochaines étapes.",
      dateCreation: "2023-10-01",
      dateStart: "2023-10-02",
      dateEnd: "2023-10-02",
      statut: "En cours",
      priority: "Élevée",
      remind: "1 heure avant",
      category: "Travail",
    ),
    Task(
      taskId: 2,
      title: "Rédaction du rapport",
      description: "Compléter le rapport mensuel pour le département.",
      dateCreation: "2023-10-03",
      dateStart: "2023-10-04",
      dateEnd: "2023-10-05",
      statut: "À faire",
      priority: "Moyenne",
      remind: "1 jour avant",
      category: "Travail",
    ),
    Task(
      taskId: 3,
      title: "Course de ravitaillement",
      description: "Acheter des provisions pour la semaine.",
      dateCreation: "2023-10-06",
      dateStart: "2023-10-07",
      dateEnd: "2023-10-07",
      statut: "Terminé",
      priority: "Faible",
      remind: "Le jour même",
      category: "Personnel",
    ),
    Task(
      taskId: 4,
      title: "Rendez-vous médical",
      description: "Consultation de suivi avec le médecin.",
      dateCreation: "2023-10-08",
      dateStart: "2023-10-09",
      dateEnd: "2023-10-09",
      statut: "En cours",
      priority: "Élevée",
      remind: "1 heure avant",
      category: "Santé",
    ),
    Task(
      taskId: 5,
      title: "Préparation de la présentation",
      description: "Créer des diapositives pour la présentation du projet.",
      dateCreation: "2023-10-10",
      dateStart: "2023-10-11",
      dateEnd: "2023-10-12",
      statut: "À faire",
      priority: "Moyenne",
      remind: "1 jour avant",
      category: "Travail",
    ),
    Task(
      taskId: 6,
      title: "Réunion avec le client",
      description: "Discuter des exigences du projet avec le client.",
      dateCreation: "2023-10-13",
      dateStart: "2023-10-14",
      dateEnd: "2023-10-14",
      statut: "En cours",
      priority: "Élevée",
      remind: "1 heure avant",
      category: "Travail",
    ),
    Task(
      taskId: 7,
      title: "Nettoyage de la maison",
      description: "Faire le ménage complet de la maison.",
      dateCreation: "2023-10-15",
      dateStart: "2023-10-16",
      dateEnd: "2023-10-16",
      statut: "Terminé",
      priority: "Faible",
      remind: "Le jour même",
      category: "Personnel",
    ),
    Task(
      taskId: 8,
      title: "Réunion de suivi",
      description: "Suivi des tâches en cours et ajustement des priorités.",
      dateCreation: "2023-10-17",
      dateStart: "2023-10-18",
      dateEnd: "2023-10-18",
      statut: "En cours",
      priority: "Moyenne",
      remind: "1 heure avant",
      category: "Travail",
    ),
    Task(
      taskId: 9,
      title: "Rédaction de l'article",
      description: "Écrire un article pour le blog de l'entreprise.",
      dateCreation: "2023-10-19",
      dateStart: "2023-10-20",
      dateEnd: "2023-10-21",
      statut: "À faire",
      priority: "Moyenne",
      remind: "1 jour avant",
      category: "Travail",
    ),
    Task(
      taskId: 10,
      title: "Réunion de planification",
      description: "Planifier les tâches pour le prochain trimestre.",
      dateCreation: "2023-10-22",
      dateStart: "2023-10-23",
      dateEnd: "2023-10-23",
      statut: "En cours",
      priority: "Élevée",
      remind: "1 heure avant",
      category: "Travail",
    ),
  ];

  List<Task> setTodayTasks(){
    return _tasks.where(
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