import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_pro/screens/pages/authentification/widgets/auth_app_bar.dart';
import '../../../widgets/buttons/task_pro_action_button.dart';
import '../../../widgets/inputs/task_pro_common_input.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AuthAppBar(chemin: '/login',),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Mot de passe oublié",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Entrer votre e-mail",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TaskProCommonInput(
                  controller: emailController, hintText: "Votre e-mail"),
              SizedBox(
                height: 60,
              ),
              TaskProActionButton(
                  buttonTitle: "Réinitialiser",
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
