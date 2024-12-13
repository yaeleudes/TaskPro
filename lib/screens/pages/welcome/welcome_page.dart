import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/task_pro_color.dart';
import '../../../widgets/buttons/task_pro_action_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  final List<Map<String, String>> carouselItems = [
    {
      'image': 'assets/images/onboarding1.png',
      'text': 'Boostez votre productivité',
    },
    {
      'image': 'assets/images/onboarding3.png',
      'text': 'Organisez enfin vos tâches efficacement',
    },
    {
      'image': 'assets/images/onboarding2.png',
      'text': 'Ne ratez plus aucune échéance',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/logos/logo.png",
                    height: 70,
                  ),
                  SizedBox(width: 15),
                  Text(
                    "TaskPro",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: TaskProColor.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              CarouselSlider(
                options: CarouselOptions(
                  height: 400,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 4),
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                ),
                items: carouselItems.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Column(
                        children: [
                          Image.asset(
                            item['image']!,
                            height: 230,
                            width: 500,
                          ),
                          SizedBox(height: 10),
                          Text(
                            item['text']!,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 100),
              TaskProActionButton(
                  buttonTitle: "Rejoindre TaskPro",
                  onPressed: () {
                    context.go("/register");
                  }),
              SizedBox(
                height: 40,
              ),
              TaskProActionButton(
                  buttonTitle: "Se connecter",
                  onPressed: () {
                    context.go("/login");
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
