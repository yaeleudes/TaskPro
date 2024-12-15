import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_pro/screens/pages/authentification/widgets/auth_app_bar.dart';
import '../../../widgets/buttons/task_pro_action_button.dart';
import '../../../widgets/inputs/task_pro_common_input.dart';
import '../../../widgets/inputs/task_pro_password_input.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize(
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
                Text(
                  "Connexion",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Entrer votre e-mail et votre mot de pass",
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
                  height: 25,
                ),
                TaskProPasswordInput(
                  controller: passwordController,
                  hintText: "Votre mot de passe",
                ),
                SizedBox(
                  height: 60,
                ),
                TaskProActionButton(
                  buttonTitle: "Connexion",
                  onPressed: () {
                    context.go("/home");
                  }),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      context.go("/forgot_password");
                    },
                    child: Text(
                      'Mot de passe oublié ?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
