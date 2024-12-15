import 'package:flutter/material.dart';
import 'package:task_pro/constants/task_pro_theme.dart';
import 'package:task_pro/services/task_service.dart';
import 'package:task_pro/widgets/buttons/task_pro_floating_button.dart';
import 'package:task_pro/widgets/modals/task_pro_modal.dart';

import 'models/task.dart';
import 'widgets/bottomNavbar/task_pro_bottom_navbar.dart';
import 'widgets/buttons/task_pro_action_button.dart';
import 'widgets/inputs/task_pro_common_input.dart';
import 'widgets/inputs/task_pro_password_input.dart';
import 'widgets/inputs/task_pro_research_input.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting('fr_FR', null).then((_) {
    runApp(const MyApp());
  });
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
      locale: const Locale('fr', 'FR'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('fr', 'FR'),
      ],
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
  TextEditingController searchController = TextEditingController();
  int _counter = 0;
  int _currentIndex = 0;
  List<Task> listeTache = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // final List<Widget> _pages = const [
  //   TodayPage(),
  //   AgendaPage(),
  //   RecherchePage(),
  //   ParcourirPage()
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
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
                const SizedBox(
                  height: 10,
                ),
                TaskProCommonInput(
                    controller: emailController, hintText: "Votre e-mail"),
                const SizedBox(
                  height: 10,
                ),
                TaskProPasswordInput(
                  controller: passwordController,
                  hintText: "Votre mot de passe",
                ),
                const SizedBox(
                  height: 10,
                ),
                TaskProResearchInput(
                    controller: searchController,
                    hintText: "tâches, catégorie, date et plus")
              ],
            ),
          ),
        ),

        // body: _pages[_currentIndex],

        bottomNavigationBar: TaskProBottomNavbar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
        ),
        floatingActionButton: TaskProFloatingButton(onPressed: () async {
          listeTache = await TaskService.getAllTask();
          for (var task in listeTache) {
            print(task.title);
          }
          print("list $listeTache");
          TaskProModal.ajouterTache(context);
        }));
  }
}
