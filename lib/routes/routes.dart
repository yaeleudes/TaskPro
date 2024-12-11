import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_pro/screens/home_screen.dart';

class Routes {
  static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  static final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/', // On va ajouter une logic d'authentification.
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomeScreen(),
      ),
      // On ajoute les autres routes à la suite.
    ],

    errorBuilder: (context, state) {
      return const Scaffold(
        body: Center(
          child: Text('Page not found'),
        ),
      );
    },
  );
}
