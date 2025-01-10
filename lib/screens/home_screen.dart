import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_pro/models/user.dart';
import 'package:task_pro/widgets/bottomNavbar/task_pro_bottom_navbar.dart';
import 'package:task_pro/widgets/buttons/task_pro_floating_button.dart';
import 'package:task_pro/widgets/task_pro_app_bar.dart';

import '../utils/local_storage.dart';
// import '../viewmodels/user_view_model.dart';
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
  User? user;
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
   void setUser() async {
    user = await LocalStorage.getUser();
    setState(() {
      
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: TaskProAppBar(title: _appBarTitles[_currentIndex], user: user,),

      // Body
      body: _pages[_currentIndex],

      // NavigationBar
      bottomNavigationBar: TaskProBottomNavbar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),

      // FloatingActionButton
      floatingActionButton: TaskProFloatingButton(onPressed: () async {
        TaskProModal.ajouterTache(context);
      }),
    );
  }
}
