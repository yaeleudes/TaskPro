import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_pro/screens/home_screen.dart';
import 'package:task_pro/screens/pages/authentification/forgot_password.dart';
import 'package:task_pro/screens/pages/authentification/login.dart';
import 'package:task_pro/screens/pages/welcome/welcome_page.dart';
import '../screens/pages/authentification/register.dart';
import '../splash.dart';
import '../utils/local_storage.dart';

class Routes {
  static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: 'splash',
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const Register(),
      ),
      GoRoute(
        path: '/forgot_password',
        builder: (context, state) => const ForgotPassword(),
      ),
    ],
    // redirect: (context, state) async {
    //   String? token = await LocalStorage.getToken();
    //   int? timestamp = await LocalStorage.getTimestamp();

    //   if (token != null && timestamp != null) {
    //     int currentTime = DateTime.now().millisecondsSinceEpoch;
    //     int elapsedTime = currentTime - timestamp;
    //     int oneDayInMillis = 24 * 60 * 60 * 1000;

    //     if (elapsedTime >= oneDayInMillis) {
    //       await LocalStorage.clear();
    //       return '/login';
    //     } else {
    //       return '/home';
    //     }
    //   } else {
    //     return '/login';
    //   }
    // },
    errorBuilder: (context, state) {
      return const Scaffold(
        body: Center(
          child: Text('Page not found'),
        ),
      );
    },
  );
}
