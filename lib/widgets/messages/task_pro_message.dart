import 'package:flutter/material.dart';

class TaskProMessage {
  static void showMessageAuth(BuildContext context, Color color, String content){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        duration: Duration(seconds: 5),
        backgroundColor: color,
      )
    );
  }

  static void showMessage(BuildContext context, String message, {Color color = Colors.black}){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        content: Text(message),
        duration: const Duration(seconds: 5),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
      )
    );
  }

  static void showMessageAction(BuildContext context, String message, Function action){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        content: Text(message),
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.black,
        action: SnackBarAction(
          label: "annuler", 
          onPressed: (){
            action();
            print("annuller");
          }
        ),
        behavior: SnackBarBehavior.floating,
      )
    );
  }
}