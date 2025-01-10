import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';
import 'package:task_pro/screens/pages/authentification/widgets/auth_app_bar.dart';
// import 'package:task_pro/viewmodels/user_view_model.dart';
import '../../../constants/task_pro_color.dart';
import '../../../services/auth_service.dart';
import '../../../widgets/buttons/task_pro_action_button.dart';
import '../../../widgets/inputs/task_pro_common_input.dart';
import '../../../widgets/inputs/task_pro_password_input.dart';
import '../../../widgets/messages/task_pro_message.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  Map<String, dynamic> reponse = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void inscription(Map<String, dynamic> body) async {
     setState(() {
      isLoading = true;
    });

    try {
      var rep = await AuthService.register(body);
      setState(() {
        reponse = rep;
      });
      if (reponse['status']) {
        TaskProMessage.showMessageAuth(context, Colors.green, reponse['message']);
        context.go("/login");
        // TaskProMessageModals.showMessageModal(context, result['message'], result['status'], (){context.go("/home");});
      } else {
        TaskProMessage.showMessageAuth(context, Colors.red, reponse['message']);
        // TaskProMessageModals.showMessageModal(context, result['message'], result['status']);
      }
      
    } catch (e) {
      print(e);
    } finally{
      setState(() {
      
      isLoading = false;
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final UserViewModel userViewModel = Provider.of<UserViewModel>(context, listen: false);

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
                        controller: nomController, hintText: "Votre nom"),
                    const SizedBox(
                      height: 25,
                    ),
                    TaskProCommonInput(
                        controller: prenomController, hintText: "Votre prenom"),
                    const SizedBox(
                      height: 25,
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
                      onPressed: () async {
                        var body = {
                          "firstname": nomController.text,
                          "name": prenomController.text,
                          "email": emailController.text,
                          "password": passwordController.text
                        };
                        // var result = await userViewModel.register(body);
                        // if (result['status']) {
                        //   TaskProMessage.showMessageAuth(context, Colors.green, result['message']);
                        //   context.go("/login");
                        //   // TaskProMessageModals.showMessageModal(context, result['message'],result['status'], (){context.go("/login");});
                        // } else {
                        //   TaskProMessage.showMessageAuth(context, Colors.red, result['message']);
                        //   // TaskProMessageModals.showMessageModal(context, result['message'],result['status']);
                        // }
                        inscription(body);
                      }
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (isLoading)
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
