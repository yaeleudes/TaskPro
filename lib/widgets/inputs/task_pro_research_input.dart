import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:task_pro/constants/task_pro_color.dart';

class TaskProResearchInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const TaskProResearchInput({super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w400
          ),
          filled: true,
          fillColor: TaskProColor.third,
          focusColor: Colors.black,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: TaskProColor.third, width: 2),
            borderRadius: BorderRadius.circular(12)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: TaskProColor.third, width: 2),
            borderRadius: BorderRadius.circular(12)
          ),
            errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: TaskProColor.third, width: 2),
            borderRadius: BorderRadius.circular(12)
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: TaskProColor.third, width: 2),
            borderRadius: BorderRadius.circular(12)
          ),
          prefixIcon: const HugeIcon(
                icon: HugeIcons.strokeRoundedSearch01,
                color: Colors.black,
                size: 24.0,
              )
        ),
      ),
    );
  }
}
