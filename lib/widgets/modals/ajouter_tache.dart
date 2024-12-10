import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:task_pro/widgets/buttons/task_pro_action_button.dart';
import 'package:task_pro/widgets/inputs/task/task_date_pickle.dart';

import '../../constants/task_pro_color.dart';
import '../inputs/task/add_task_dropdown.dart';
import '../inputs/task/add_task_input.dart';
import '../inputs/task/task_remind_pickle.dart';

class AjouterTache extends StatefulWidget {
  const AjouterTache({super.key});

  @override
  State<AjouterTache> createState() => _AjouterTacheState();
}

class _AjouterTacheState extends State<AjouterTache> {
  TextEditingController titleController = TextEditingController();
  String? dropDownValue;

  void _oonChanged(String? value){
    setState(() {
      dropDownValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .7,
      child: Form(
        child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Nouvelle tâche",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const HugeIcon(
                    icon: HugeIcons.strokeRoundedMultiplicationSign,
                    color: Colors.black,
                    size: 24.0,
                  )
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TaskTitleInput(controller: titleController, label: "Titre :", hintText: "ex.: Lire un chapitre par joure",),
                const SizedBox(height: 16,),
                TaskTitleInput(controller: titleController, label: "Description :", hintText: "Décrivez votre tâche ici",),
                const SizedBox(height: 16,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TaskDatePickle(label: "Date d'échéance :",),
                    TaskRemindPickle(label: "Rappels :",),
                  ],
                ),
                const SizedBox(height: 16,),
                AddTaskDropdown(dropDownValue: dropDownValue, onChanged: _oonChanged,),
                const SizedBox(height: 16,),
                TaskProActionButton(buttonTitle: "Ajouter", onPressed: (){print("Tache ajoutée");})
              ],
            ),
          )
        ],
      )),
    );
  }
}
