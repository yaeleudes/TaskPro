import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:task_pro/utils/local_storage.dart';
import 'package:task_pro/viewmodels/user_view_model.dart';

import '../../constants/task_pro_color.dart';

class Parametre extends StatefulWidget {
  const Parametre({super.key});

  @override
  State<Parametre> createState() => _ParametreState();
}

class _ParametreState extends State<Parametre> {
  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Parametre"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  userViewModel.logout();
                  context.go("/");
                },
                leading: HugeIcon(
                  icon: HugeIcons.strokeRoundedLogout03,
                  color: TaskProColor.red,
                  size: 24.0,
                ),
                title: Text(
                  "Déconnexion",
                  style: TextStyle(color: TaskProColor.red),
                ),
              )
            ],
          ),
        ));
  }
}
