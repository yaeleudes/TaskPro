import 'package:flutter/material.dart';
import 'package:task_pro/constants/task_pro_color.dart';

class TaskProTheme {
  // Light Theme
  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      surface: Colors.white,
      primary: TaskProColor.secondary,
      secondary: TaskProColor.secondary
    )
  );

  // Dark Theme
  static ThemeData dark = ThemeData();
}
