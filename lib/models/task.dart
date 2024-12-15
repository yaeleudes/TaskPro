class Task {
   int taskId;
   String title;
   String description;
   String dateCreation;
   String dateStart;
   String sateEnd;
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
    required this.sateEnd,
    required this.statut,
    required this.priority,
    required this.remind,
    required this.category
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      taskId: json["taskId"], 
      title: json["title"], 
      description: json["description"], 
      dateCreation: json["dateCreation"], 
      dateStart: json["dateStart"], 
      sateEnd: json["dateEnd"], 
      statut: json["statut"], 
      priority: json["priority"], 
      remind: json["rappel"], 
      category: json["category"]
    );
  }
}
