import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../constants/task_pro_color.dart';

class AddTaskDropdown extends StatelessWidget {
  final String? dropDownValue;
  final Function(String?) onChanged;
  const AddTaskDropdown({super.key, required this.onChanged, required this.dropDownValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(6)
      ),
      child: DropdownButton(
        value: dropDownValue,
        items: const [
          DropdownMenuItem(child: Text("Education"), value: 'Education',),
          DropdownMenuItem(child: Text("Perso"), value: 'Person',),
          DropdownMenuItem(child: Text("Travail"), value: 'Travail',),
        ],
        onChanged: onChanged,
        isExpanded: true,
        icon: HugeIcon(
          icon: HugeIcons.strokeRoundedArrowDown01,
          color: TaskProColor.primary,
          size: 24.0,
        ),
        hint: Text("Sélectionnez une catégorie"),
        style: const TextStyle(color: Colors.black),
        underline: Container(color: Colors.white,),
      ),
    );
  }
}
