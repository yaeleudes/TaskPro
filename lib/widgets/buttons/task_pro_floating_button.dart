import 'package:flutter/material.dart';
import 'package:task_pro/constants/task_pro_color.dart';

class TaskProFloatingButton extends StatelessWidget {
  final VoidCallback onPressed;
  const TaskProFloatingButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: TaskProColor.primary,
      foregroundColor: Colors.white,
      child: const Icon(Icons.add),
    );
  }
}