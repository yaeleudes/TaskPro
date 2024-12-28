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
        items: [
          DropdownMenuItem(value: 'Education',child: Container(child: Row(children: [const Text('Education'), const SizedBox(width: 4,),Image.asset("assets/icons/education.png", width: 22,)],),),),
          DropdownMenuItem(value: 'Personnel',child: Container(child: Row(children: [const Text('Personnel'), const SizedBox(width: 4,),Image.asset("assets/icons/perso.png", width: 22,)],),),),
          DropdownMenuItem(value: 'Travail',child: Container(child: Row(children: [const Text('Travail'), const SizedBox(width: 4,),Image.asset("assets/icons/travail.png", width: 22,)],),),),
          DropdownMenuItem(value: 'Santé',child: Container(child: Row(children: [const Text('Santé'), const SizedBox(width: 4,),Image.asset("assets/icons/sante.png", width: 22,)],),),),
          DropdownMenuItem(value: 'Autre',child: Container(child: Row(children: [const Text('Autre'), const SizedBox(width: 4,),Image.asset("assets/icons/plus.png", width: 22,)],),),),
        ],
        onChanged: onChanged,
        isExpanded: true,
        icon: HugeIcon(
          icon: HugeIcons.strokeRoundedArrowDown01,
          color: TaskProColor.primary,
          size: 24.0,
        ),
        hint: const Text("Sélectionnez une catégorie"),
        style: const TextStyle(color: Colors.black),
        underline: Container(color: Colors.white,),
      ),
    );
  }
}
