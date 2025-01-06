import 'dart:convert';

class Task {
  int taskId;
  String title;
  String description;
  DateTime dateCreation;
  DateTime dateStart;
  DateTime dateEnd;
  String statut;
  String priority;
  String remind;
  String category;

  Task({
    required this.taskId,
    required this.title,
    required this.description,
    required this.dateCreation,
    required this.dateStart,
    required this.dateEnd,
    required this.statut,
    required this.priority,
    required this.remind,
    required this.category,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      taskId: json["taskId"],
      title: utf8.decode(json["title"].runes.toList()),
      description: utf8.decode(json["description"].runes.toList()),
      dateCreation: DateTime(
        json["dateCreation"][0],
        json["dateCreation"][1],
        json["dateCreation"][2],
        json["dateCreation"][3],
        json["dateCreation"][4],
      ),
      dateStart: DateTime(
        json["dateStart"][0],
        json["dateStart"][1],
        json["dateStart"][2],
        json["dateStart"][3],
        json["dateStart"][4],
      ),
      dateEnd: DateTime(
        json["dateEnd"][0],
        json["dateEnd"][1],
        json["dateEnd"][2],
        json["dateEnd"][3],
        json["dateEnd"][4],
      ),
      statut: utf8.decode(json["statut"].runes.toList()),
      priority: utf8.decode(json["priority"].runes.toList()),
      remind: utf8.decode(json["rappel"].runes.toList()),
      category: utf8.decode(json["category"].runes.toList()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "taskId": taskId,
      "title": title,
      "description": description,
      "dateCreation": [
        dateCreation.year,
        dateCreation.month,
        dateCreation.day,
        dateCreation.hour,
        dateCreation.minute,
      ],
      "dateStart": [
        dateStart.year,
        dateStart.month,
        dateStart.day,
        dateStart.hour,
        dateStart.minute,
      ],
      "dateEnd": [
        dateEnd.year,
        dateEnd.month,
        dateEnd.day,
        dateEnd.hour,
        dateEnd.minute,
      ],
      "statut": statut,
      "priority": priority,
      "rappel": remind,
      "category": category,
    };
  }

  static List<Task> tasks = [
    Task(
        taskId: 1,
        title: 'Réunion d\'équipe',
        description: 'Discuter des progrès du projet',
        dateCreation: DateTime.parse('2024-12-01T09:00:00Z'),
        dateStart: DateTime.parse('2024-12-01T10:00:00Z'),
        dateEnd: DateTime.parse('2024-12-16T11:00:00Z'),
        statut: 'En cours',
        priority: 'Élevée',
        remind: '15 minutes avant',
        category: 'Travail'),
    Task(
        taskId: 2,
        title: 'Acheter des provisions',
        description: 'Liste de courses pour la semaine',
        dateCreation: DateTime.parse('2024-12-02T08:00:00Z'),
        dateStart: DateTime.parse('2024-12-02T09:00:00Z'),
        dateEnd: DateTime.parse('2024-12-16T10:00:00Z'),
        statut: 'À faire',
        priority: 'Moyenne',
        remind: '30 minutes avant',
        category: 'Personnel'),
    Task(
        taskId: 3,
        title: 'Rendez-vous chez le médecin',
        description: 'Consultation de routine',
        dateCreation: DateTime.parse('2024-12-03T14:00:00Z'),
        dateStart: DateTime.parse('2024-12-03T15:00:00Z'),
        dateEnd: DateTime.parse('2024-12-17T16:00:00Z'),
        statut: 'À faire',
        priority: 'Élevée',
        remind: '1 heure avant',
        category: 'Santé'),
    Task(
        taskId: 4,
        title: 'Préparer la présentation',
        description: 'Finaliser les diapositives',
        dateCreation: DateTime.parse('2024-12-04T11:00:00Z'),
        dateStart: DateTime.parse('2024-12-04T12:00:00Z'),
        dateEnd: DateTime.parse('2024-12-17T13:00:00Z'),
        statut: 'En cours',
        priority: 'Moyenne',
        remind: '30 minutes avant',
        category: 'Travail'),
    Task(
        taskId: 5,
        title: 'Cours de yoga',
        description: 'Séance de relaxation',
        dateCreation: DateTime.parse('2024-12-05T18:00:00Z'),
        dateStart: DateTime.parse('2024-12-05T19:00:00Z'),
        dateEnd: DateTime.parse('2024-12-20T20:00:00Z'),
        statut: 'À faire',
        priority: 'Faible',
        remind: '15 minutes avant',
        category: 'Personnel'),
    Task(
        taskId: 6,
        title: 'Réviser le rapport',
        description: 'Vérifier les données et les conclusions',
        dateCreation: DateTime.parse('2024-12-06T12:00:00Z'),
        dateStart: DateTime.parse('2024-12-06T11:00:00Z'),
        dateEnd: DateTime.parse('2024-12-20T12:00:00Z'),
        statut: 'En cours',
        priority: 'Élevée',
        remind: '30 minutes avant',
        category: 'Travail'),
    Task(
        taskId: 7,
        title: 'Dîner avec des amis',
        description: 'Soirée entre amis',
        dateCreation: DateTime.parse('2024-12-07T19:00:00Z'),
        dateStart: DateTime.parse('2024-12-07T20:00:00Z'),
        dateEnd: DateTime.parse('2024-12-20T22:00:00Z'),
        statut: 'À faire',
        priority: 'Faible',
        remind: '1 heure avant',
        category: 'Personnel'),
    Task(
        taskId: 8,
        title: 'Nettoyer la maison',
        description: 'Tâches ménagères hebdomadaires',
        dateCreation: DateTime.parse('2024-12-08T09:00:00Z'),
        dateStart: DateTime.parse('2024-12-08T10:00:00Z'),
        dateEnd: DateTime.parse('2024-12-27T12:00:00Z'),
        statut: 'À faire',
        priority: 'Moyenne',
        remind: '30 minutes avant',
        category: 'Personnel'),
    Task(
        taskId: 9,
        title: 'Lire un livre',
        description: 'Temps de lecture',
        dateCreation: DateTime.parse('2024-12-09T18:00:00Z'),
        dateStart: DateTime.parse('2024-12-09T19:00:00Z'),
        dateEnd: DateTime.parse('2024-12-29T20:00:00Z'),
        statut: 'À faire',
        priority: 'Faible',
        remind: '15 minutes avant',
        category: 'Personnel'),
    Task(
        taskId: 10,
        title: 'Faire du sport',
        description: 'Séance de fitness',
        dateCreation: DateTime.parse('2024-12-10T08:00:00Z'),
        dateStart: DateTime.parse('2024-12-10T09:00:00Z'),
        dateEnd: DateTime.parse('2024-12-31T10:00:00Z'),
        statut: 'À faire',
        priority: 'Moyenne',
        remind: '30 minutes avant',
        category: 'Santé'),
    Task(
      taskId: 11,
      title: "Réunion d'équipe",
      description: "Discuter des progrès du projet et des prochaines étapes.",
      dateCreation: DateTime.parse("2024-12-29T20:00:00Z"),
      dateStart: DateTime.parse("2024-12-29T20:00:00Z"),
      dateEnd: DateTime.parse("2024-12-29T20:00:00Z"),
      statut: "En cours",
      priority: "Élevée",
      remind: "1 heure avant",
      category: "Travail",
    ),
    Task(
      taskId: 12,
      title: "Rédaction du rapport",
      description: "Compléter le rapport mensuel pour le département.",
      dateCreation: DateTime.parse("2024-12-29T20:00:00Z"),
      dateStart: DateTime.parse("2024-12-29T20:00:00Z"),
      dateEnd: DateTime.parse("2024-12-29T20:00:00Z"),
      statut: "À faire",
      priority: "Moyenne",
      remind: "1 jour avant",
      category: "Travail",
    ),
    Task(
      taskId: 13,
      title: "Course de ravitaillement",
      description: "Acheter des provisions pour la semaine.",
      dateCreation: DateTime.parse("2024-12-29T20:00:00Z"),
      dateStart: DateTime.parse("2024-12-29T20:00:00Z"),
      dateEnd: DateTime.parse("2024-12-29T20:00:00Z"),
      statut: "Terminé",
      priority: "Faible",
      remind: "Le jour même",
      category: "Personnel",
    ),
    Task(
      taskId: 14,
      title: "Rendez-vous médical",
      description: "Consultation de suivi avec le médecin.",
      dateCreation: DateTime.parse("2024-12-29T20:00:00Z"),
      dateStart: DateTime.parse("2024-12-29T20:00:00Z"),
      dateEnd: DateTime.parse("2024-12-29T20:00:00Z"),
      statut: "En cours",
      priority: "Élevée",
      remind: "1 heure avant",
      category: "Santé",
    ),
    Task(
      taskId: 15,
      title: "Préparation de la présentation",
      description: "Créer des diapositives pour la présentation du projet.",
      dateCreation: DateTime.parse("2024-12-29T20:00:00Z"),
      dateStart: DateTime.parse("2024-12-29T20:00:00Z"),
      dateEnd: DateTime.parse("2025-01-08T20:00:00Z"),
      statut: "À faire",
      priority: "Moyenne",
      remind: "1 jour avant",
      category: "Travail",
    ),
    Task(
      taskId: 16,
      title: "Réunion avec le client",
      description: "Discuter des exigences du projet avec le client.",
      dateCreation: DateTime.parse("2024-12-29T20:00:00Z"),
      dateStart: DateTime.parse("2024-12-29T20:00:00Z"),
      dateEnd: DateTime.parse("2025-01-07T20:00:00Z"),
      statut: "En cours",
      priority: "Élevée",
      remind: "1 heure avant",
      category: "Travail",
    ),
    Task(
      taskId: 17,
      title: "Nettoyage de la maison",
      description: "Faire le ménage complet de la maison.",
      dateCreation: DateTime.parse("2024-12-29T20:00:00Z"),
      dateStart: DateTime.parse("2024-12-29T20:00:00Z"),
      dateEnd: DateTime.parse("2024-12-29T20:00:00Z"),
      statut: "Terminé",
      priority: "Faible",
      remind: "Le jour même",
      category: "Personnel",
    ),
    Task(
      taskId: 18,
      title: "Réunion de suivi",
      description: "Suivi des tâches en cours et ajustement des priorités.",
      dateCreation: DateTime.parse("2024-12-29T20:00:00Z"),
      dateStart: DateTime.parse("2024-12-29T20:00:00Z"),
      dateEnd: DateTime.parse("2024-12-29T20:00:00Z"),
      statut: "En cours",
      priority: "Moyenne",
      remind: "1 heure avant",
      category: "Travail",
    ),
    Task(
      taskId: 19,
      title: "Rédaction de l'article",
      description: "Écrire un article pour le blog de l'entreprise.",
      dateCreation: DateTime.parse("2024-12-29T20:00:00Z"),
      dateStart: DateTime.parse("2025-01-10T20:00:00Z"),
      dateEnd: DateTime.parse("2025-01-10T20:00:00Z"),
      statut: "À faire",
      priority: "Moyenne",
      remind: "1 jour avant",
      category: "Travail",
    ),
    Task(
      taskId: 20,
      title: "Réunion de planification",
      description: "Planifier les tâches pour le prochain trimestre.",
      dateCreation: DateTime.parse("2024-12-29T20:00:00Z"),
      dateStart: DateTime.parse("2025-01-06T20:00:00Z"),
      dateEnd: DateTime.parse("2025-01-06T20:00:00Z"),
      statut: "En cours",
      priority: "Élevée",
      remind: "1 heure avant",
      category: "Travail",
    ),
  ];

  // static List<Task> tasks = [];

  static List<Task> getListByStatut(String value){
    return tasks.where((task) => task.statut.toLowerCase().contains(value.toLowerCase())).toList();
  }

  static List<Task> getListByCategory(String value){
    return tasks.where((task) => task.category.toLowerCase().contains(value.toLowerCase())).toList();
  }

  void changeStatusToEnd(){
    statut = "Terminé";
    tasks.remove(this);
    print("Terminé");
  }
}
