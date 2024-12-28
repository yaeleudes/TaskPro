// import 'package:flutter/material.dart';
// import 'package:task_pro/widgets/bottomNavbar/task_pro_bottom_navbar.dart';
// import 'package:task_pro/widgets/buttons/task_pro_action_button.dart';
// import 'package:task_pro/widgets/buttons/task_pro_floating_button.dart';
// import 'package:task_pro/widgets/inputs/task_pro_common_input.dart';
// import 'package:task_pro/widgets/inputs/task_pro_password_input.dart';
// import 'package:task_pro/widgets/inputs/task_pro_research_input.dart';
// import 'package:task_pro/widgets/modals/task_pro_modal.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController searchController = TextEditingController();
//   int _counter = 0;
//   int _currentIndex = 0;

//   // void _incrementCounter() {
//   //   setState(() {
//   //     _counter++;
//   //   });
//   // }

//   // final List<Widget> _pages = const [
//   //   TodayPage(),
//   //   AgendaPage(),
//   //   RecherchePage(),
//   //   ParcourirPage()
//   // ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//           title: Text(widget.title),
//         ),
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 const Text(
//                   'You have pushed the button this many times:',
//                 ),
//                 Text(
//                   '$_counter',
//                   style: Theme.of(context).textTheme.headlineMedium,
//                 ),
//                 TaskProActionButton(
//                     buttonTitle: "Rejoindre TaskPro",
//                     onPressed: () {
//                       print("action");
//                     }),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 TaskProCommonInput(
//                     controller: emailController, hintText: "Votre e-mail"),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 TaskProPasswordInput(
//                   controller: passwordController,
//                   hintText: "Votre mot de passe",
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 TaskProResearchInput(
//                     controller: searchController,
//                     hintText: "tâches, catégorie, date et plus")
//               ],
//             ),
//           ),
//         ),

//         // body: _pages[_currentIndex],

//         bottomNavigationBar: TaskProBottomNavbar(
//           currentIndex: _currentIndex,
//           onTap: _onItemTapped,
//         ),
//         floatingActionButton: TaskProFloatingButton(onPressed: () {
//           TaskProModal.ajouterTache(context);
//         }));
//   }
// }
