import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
// import 'package:provider/provider.dart';
import 'package:task_pro/models/user.dart';
import 'package:task_pro/screens/pages/parametre.dart';
import 'package:task_pro/utils/local_storage.dart';

// import '../viewmodels/user_view_model.dart';

class TaskProAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final User? user;
  const TaskProAppBar({super.key, required this.title, required this.user});

  @override
  State<TaskProAppBar> createState() => _TaskProAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _TaskProAppBarState extends State<TaskProAppBar> {
  User? user;

  List<Widget> _buildActions() {
    final excludedTitles = ["Aujourd'hui", "Prochainement", "", "Rechercher"];
    if (!excludedTitles.contains(widget.title)) {
      return [
        IconButton(
          onPressed: () {},
          icon: const HugeIcon(
            icon: HugeIcons.strokeRoundedNotification03,
            color: Colors.black,
            size: 24.0,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Parametre()));
          },
          icon: const HugeIcon(
            icon: HugeIcons.strokeRoundedSettings02,
            color: Colors.black,
            size: 24.0,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: () {},
          icon: const HugeIcon(
            icon: HugeIcons.strokeRoundedMoreVertical,
            color: Colors.black,
            size: 24.0,
          ),
        ),
      ];
    }
  }

  void setUser() async {
    user = await LocalStorage.getUser();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUser();
  }

  @override
  Widget build(BuildContext context) {
    final excludedTitles = ["Aujourd'hui", "Prochainement", "", "Rechercher"];
    return AppBar(
        title: Text(
          excludedTitles.contains(widget.title)
              ? widget.title
              : widget.user?.nom ?? "myPsoeudo",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        actions: _buildActions());
  }
}
