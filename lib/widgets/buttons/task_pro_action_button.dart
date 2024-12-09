import 'package:flutter/material.dart';
import 'package:task_pro/constants/task_pro_color.dart';

class TaskProActionButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onPressed;
  const TaskProActionButton(
      {super.key, required this.buttonTitle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: TaskProColor.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          )
        ), 
        child: Text(
          buttonTitle,
          style: const TextStyle(
            fontSize: 20
          ),
        ),
      ),
    );
  }
}
