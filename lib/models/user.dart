class User {
  int id;
  String nom;
  String prenom;
  String email;
  String password;

  User({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.password
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["userId"], 
      nom: json["name"], 
      prenom: json["firstname"], 
      email: json["email"], 
      password: json["password"]
    );
  }
}
