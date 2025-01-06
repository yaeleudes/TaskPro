import 'package:flutter/material.dart';
import 'package:task_pro/constants/task_pro_color.dart';

import 'utils/local_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // _checkToken();
  }

  // Future<void> _checkToken() async {
  //   String? token = await LocalStorage.getToken();
  //   int? timestamp = await LocalStorage.getTimestamp();

  //   if (token != null && timestamp != null) {
  //     int currentTime = DateTime.now().millisecondsSinceEpoch;
  //     int elapsedTime = currentTime - timestamp;
  //     int oneDayInMillis = 24 * 60 * 60 * 1000;

  //     if (elapsedTime >= oneDayInMillis) {
  //       await LocalStorage.clear();
  //       Navigator.pushReplacementNamed(context, '/');
  //     } else {
  //       Navigator.pushReplacementNamed(context, '/home');
  //     }
  //   } else {
  //     Navigator.pushReplacementNamed(context, '/');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(color: TaskProColor.primary,),
      ),
    );
  }
}