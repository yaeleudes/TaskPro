import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_pro/screens/pages/authentification/widgets/auth_app_bar.dart';
import '../../../widgets/buttons/task_pro_action_button.dart';
import '../../../widgets/inputs/task_pro_common_input.dart';
import '../../../widgets/inputs/task_pro_password_input.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AuthAppBar(chemin: '/',),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Inscription",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Entrer votre e-mail et votre mot de pass",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TaskProCommonInput(
                  controller: emailController, hintText: "Votre e-mail"),
              const SizedBox(
                height: 25,
              ),
              TaskProPasswordInput(
                controller: passwordController,
                hintText: "Votre mot de passe",
              ),
              const SizedBox(
                height: 60,
              ),
              TaskProActionButton(
                  buttonTitle: "Inscription",
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
