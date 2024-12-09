import 'package:flutter/material.dart';
import 'package:task_pro/widgets/bottomNavbar/task_pro_bottom_navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(),

      // Body
      body: Center(),

      // NavigationBar
      bottomNavigationBar: TaskProBottomNavbar(),
    );
  }
}
