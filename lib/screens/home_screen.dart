import 'package:flutter/material.dart';
import 'package:task_pro/widgets/bottomNavbar/task_pro_bottom_navbar.dart';
import 'package:task_pro/widgets/buttons/task_pro_floating_button.dart';
import 'package:task_pro/widgets/task_pro_app_bar.dart';

import '../widgets/modals/task_pro_modal.dart';
import 'pages/agenda_page.dart';
import 'pages/parcourir_page.dart';
import 'pages/recherche_page.dart';
import 'pages/today_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    TodayPage(),
    AgendaPage(),
    RecherchePage(),
    ParcourirPage()
  ];

  final List<String> _appBarTitles = const [
    "Aujourd'hui",
    "Prochainement",
    "Rechercher",
    "myPsoeudo"
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: TaskProAppBar(title: _appBarTitles[_currentIndex]),

      // Body
      body: _pages[_currentIndex],

      // NavigationBar
      bottomNavigationBar: TaskProBottomNavbar(currentIndex: _currentIndex, onTap: _onItemTapped,),

      // FloatingActionButton
      floatingActionButton: TaskProFloatingButton(onPressed: () async {
        TaskProModal.ajouterTache(context);
      }),
    );
  }
}
