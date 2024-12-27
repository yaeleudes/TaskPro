import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:task_pro/viewmodels/task_date_viewmodel.dart';
import 'package:task_pro/widgets/buttons/task_pro_action_button.dart';
import 'package:task_pro/widgets/inputs/task/task_date_pickle.dart';
import 'package:task_pro/widgets/inputs/task/task_priority_pickle.dart';

import '../inputs/task/add_task_description_input.dart';
import '../inputs/task/add_task_dropdown.dart';
import '../inputs/task/add_task_title_input.dart';
import '../inputs/task/task_remind_pickle.dart';

class AjouterTache extends StatefulWidget {
  const AjouterTache({super.key});

  @override
  State<AjouterTache> createState() => _AjouterTacheState();
}

class _AjouterTacheState extends State<AjouterTache> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String? dropDownValue;
  String? _selectedPriority = "Priorité";
  String? _selectedRemind = "Rappel";
  DateTime? _selectedDay = DateTime.now(); 
  TimeOfDay? _selectedTime = TimeOfDay.now();
  Map<String, dynamic>? selectedDateData;

  void _oonChanged(String? value){
    setState(() {
      dropDownValue = value;
    });
  }

  void _onSelectedPriority(String? value){
    setState(() {
      _selectedPriority = value;
    });
    print("Priorité sélectionnée : $value");
  }

  void _onSelectedRemind(String? value){
    setState(() {
      _selectedRemind = value;
    });
    print("Rappel sélectionnée : $value");
  }

  void _onDateSelected(Map<String, dynamic>? result) {
    if (result != null) {
      setState(() {
        selectedDateData = result;
        _selectedDay = result['selectedDay'] as DateTime?;
        _selectedTime = result['selectedTime'] as TimeOfDay?;
      });
      print('Données reçues dans AjouterTache : $result');
    } else {
      print('Aucune donnée reçue.');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        // height: size.height * .62,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
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
                
              // Champs pour la création d'une tâche
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TaskTitleInput(controller: titleController, hintText: "Titre de la tâche",),
                    const SizedBox(height: 8,),
                    TaskDescription(controller: descriptionController, hintText: "Décrivez votre tâche ici",),
                    const SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TaskDatePickle(onDateSelected: _onDateSelected,),
                        TaskRemindPickle(selectedRemind: _selectedRemind, onSelectedRemind: _onSelectedRemind,),
                        TaskPriorityPickle(priorityValue: _selectedPriority, onSelected: _onSelectedPriority,)
                      ],
                    ),
                    const SizedBox(height: 16,),
                    AddTaskDropdown(dropDownValue: dropDownValue, onChanged: _oonChanged,),
                    const SizedBox(height: 16,),
                    TaskProActionButton(buttonTitle: "Ajouter", onPressed: (){
                      print('Date heure : ${TaskDateViewmodel.formatDate(_selectedDay, _selectedTime?.format(context))}');
                    })
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
