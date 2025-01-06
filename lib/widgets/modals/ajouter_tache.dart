import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:task_pro/viewmodels/task_date_viewmodel.dart';
import 'package:task_pro/viewmodels/task_view_model.dart';
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
  bool _isButtonEnabled = false;

  void _onChanged(String? value) {
    setState(() {
      dropDownValue = value;
    });
  }

  void _onSelectedPriority(String? value) {
    setState(() {
      _selectedPriority = value;
    });
    print("Priorité sélectionnée : $value");
  }

  void _onSelectedRemind(String? value) {
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
  void initState() {
    super.initState();
    titleController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    titleController.removeListener(_onTextChanged);
    titleController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _isButtonEnabled = titleController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final taskViewModel = Provider.of<TaskViewModel>(context);
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (_, controller) {
        return SingleChildScrollView(
          controller: controller,
          child: Padding(
            padding: EdgeInsets.zero,
            child: Form(
              child: Column(

                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 10, top: 10, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Nouvelle tâche",
                          style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const HugeIcon(
                            icon: HugeIcons.strokeRoundedMultiplicationSign,
                            color: Colors.black,
                            size: 24.0,
                          ),
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
                        TaskTitleInput(
                            controller: titleController,
                            hintText: "Titre de la tâche"),
                        const SizedBox(height: 8),
                        TaskDescription(
                            controller: descriptionController,
                            hintText: "Décrivez votre tâche ici"),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TaskDatePickle(onDateSelected: _onDateSelected),
                            TaskRemindPickle(
                                selectedRemind: _selectedRemind,
                                onSelectedRemind: _onSelectedRemind),
                            TaskPriorityPickle(
                                priorityValue: _selectedPriority,
                                onSelected: _onSelectedPriority),
                          ],
                        ),
                        const SizedBox(height: 16),
                        AddTaskDropdown(
                            dropDownValue: dropDownValue, onChanged: _onChanged),
                        const SizedBox(height: 16),
                        TaskProActionButton(
                          buttonTitle: "Ajouter",
                          onPressed: _isButtonEnabled
                              ? () async {
                                  var body = {
                                    "title": titleController.text,
                                    "description": descriptionController.text,
                                    "dateCreation": TaskDateViewmodel.formatDate(
                                        DateTime.now()),
                                    "dateStart": TaskDateViewmodel.formatDate(
                                        DateTime.now()),
                                    "dateEnd": TaskDateViewmodel.formatDate(
                                        _selectedDay,
                                        _selectedTime?.format(context)),
                                    "statut": "À faire",
                                    "priority": _selectedPriority == "Priorité"
                                        ? ''
                                        : _selectedPriority,
                                    "rappel": _selectedRemind == "Rappel"
                                        ? ''
                                        : _selectedRemind,
                                    "category": dropDownValue ?? ""
                                  };
                                  print(body);
                                  bool success = await taskViewModel.addTask(body);
                                  if (success) {
                                    Navigator.of(context).pop();
                                  } else {}
                                  print('Date heure : ${TaskDateViewmodel.formatDate(_selectedDay, _selectedTime?.format(context))}');
                                }
                              : null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  
      },
    );
  }
}
