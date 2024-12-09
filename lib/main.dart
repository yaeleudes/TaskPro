import 'package:flutter/material.dart';
import 'package:task_pro/constants/task_pro_color.dart';
import 'package:task_pro/constants/task_pro_theme.dart';
import 'package:task_pro/widgets/buttons/task_pro_action_button.dart';
import 'package:task_pro/widgets/buttons/task_pro_floating_button.dart';
import 'package:task_pro/widgets/inputs/task_pro_common_input.dart';

import 'widgets/bottomNavbar/task_pro_bottom_navbar.dart';
import 'widgets/inputs/task_pro_password_input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: TaskProTheme.light,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                TaskProActionButton(
                    buttonTitle: "Rejoindre TaskPro",
                    onPressed: () {
                      print("action");
                    }),
                SizedBox(
                  height: 10,
                ),
                TaskProCommonInput(
                  controller: emailController, 
                  hintText: "Votre e-mail"
                ),
                SizedBox(
                  height: 10,
                ),
                TaskProPasswordInput(
                  controller: passwordController,
                  hintText: "Votre mot de passe",
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: TaskProBottomNavbar(),
        floatingActionButton: TaskProFloatingButton(onPressed: _incrementCounter));
  }
}
