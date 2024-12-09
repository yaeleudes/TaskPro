import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:task_pro/constants/task_pro_color.dart';

class TaskProBottomNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const TaskProBottomNavbar({super.key, required this.onTap, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        elevation: 5,
        unselectedItemColor: Colors.black,
        selectedItemColor: TaskProColor.primary,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
              icon: const HugeIcon(
                icon: HugeIcons.strokeRoundedCalendar04,
                color: Colors.black,
                size: 24.0,
              ),
              activeIcon: HugeIcon(
                icon: HugeIcons.strokeRoundedCalendar04,
                color: TaskProColor.primary,
                size: 24.0,
              ),
              label: "Ajourd'hui"),
          BottomNavigationBarItem(
              icon: const HugeIcon(
                icon: HugeIcons.strokeRoundedCalendar03,
                color: Colors.black,
                size: 24.0,
              ),
              activeIcon: HugeIcon(
                icon: HugeIcons.strokeRoundedCalendar03,
                color: TaskProColor.primary,
                size: 24.0,
              ),
              label: "Agenda"),
          BottomNavigationBarItem(
              icon: const HugeIcon(
                icon: HugeIcons.strokeRoundedSearch01,
                color: Colors.black,
                size: 24.0,
              ),
              activeIcon: HugeIcon(
                icon: HugeIcons.strokeRoundedSearch01,
                color: TaskProColor.primary,
                size: 24.0,
              ),
              label: "Rechercher"),
          BottomNavigationBarItem(
              icon: const HugeIcon(
                icon: HugeIcons.strokeRoundedMenu01,
                color: Colors.black,
                size: 24.0,
              ),
              activeIcon: HugeIcon(
                icon: HugeIcons.strokeRoundedMenu01,
                color: TaskProColor.primary,
                size: 24.0,
              ),
              label: "Parcourir"),
        ]);
  }
}
