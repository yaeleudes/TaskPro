import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:task_pro/screens/pages/authentification/widgets/auth_app_bar.dart';
import '../../../constants/task_pro_color.dart';
import '../../../viewmodels/user_view_model.dart';
import '../../../widgets/buttons/task_pro_action_button.dart';
import '../../../widgets/inputs/task_pro_common_input.dart';
import '../../../widgets/inputs/task_pro_password_input.dart';
import '../../../widgets/modals/task_pro_message_modals.dart';

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
    final UserViewModel userViewModel = Provider.of<UserViewModel>(context);
    return Stack(
      children: [
        Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: AuthAppBar(
              chemin: '/',
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Connexion",
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
                        buttonTitle: "Connexion",
                        onPressed: () async {
                          var body = {
                            "email": emailController.text,
                            "password": passwordController.text
                          };
                          print(body);
                          var result = await userViewModel.login(body);
                        
                        if (result['status']) {
                          TaskProMessageModals.showMessageModal(context, result['message'], result['status'], (){context.go("/home");});
                        } else {
                          TaskProMessageModals.showMessageModal(context, result['message'], result['status']);
                        }
                        }
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          context.go("/forgot_password");
                        },
                        child: const Text(
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
          ),
        ),
        if (userViewModel.isLoading)
          Positioned.fill(
            child: Container(
              color: Colors.white.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(
                  color: TaskProColor.primary,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
