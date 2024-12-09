import 'package:flutter/material.dart';
import 'package:task_pro/screens/pages/agenda_page.dart';
import 'package:task_pro/screens/pages/parcourir_page.dart';
import 'package:task_pro/screens/pages/recherche_page.dart';
import 'package:task_pro/screens/pages/today_page.dart';

class TaskProBottomNavbar extends StatefulWidget {
  const TaskProBottomNavbar({super.key});

  @override
  State<TaskProBottomNavbar> createState() => _TaskProBottomNavbarState();
}

class _TaskProBottomNavbarState extends State<TaskProBottomNavbar> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    TodayPage(),
    AgendaPage(),
    RecherchePage(),
    ParcourirPage()
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      elevation: 3,
      items: [
        
      ]
    );
  }
}
