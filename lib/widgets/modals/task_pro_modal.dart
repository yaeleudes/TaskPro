import 'package:flutter/material.dart';
import 'package:task_pro/widgets/modals/ajouter_tache.dart';


class TaskProModal {
  // Modal pour ajouter une tâche
  static Future ajouterTache(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return AjouterTache();
      }
    );
  }

  // static Future dateSelection(BuildContext context){
  //   return showModalBottomSheet(
  //     context: context, 
  //     isScrollControlled: true,
  //     enableDrag: true,
  //     builder: (BuildContext context){
  //       return DatePicking();
  //     }
  //   );
  // }
}
