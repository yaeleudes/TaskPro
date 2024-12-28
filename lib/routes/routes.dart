import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_pro/screens/home_screen.dart';
import 'package:task_pro/screens/pages/authentification/forgot_password.dart';
import 'package:task_pro/screens/pages/authentification/login.dart';
import 'package:task_pro/screens/pages/welcome/welcome_page.dart';

import '../screens/pages/authentification/register.dart';

class Routes {
  static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  // static final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => WelcomePage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => Login(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => Register(),
      ),
      GoRoute(
        path: '/forgot_password',
        builder: (context, state) => ForgotPassword(),
      ),
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