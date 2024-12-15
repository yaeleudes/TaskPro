import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class TaskProAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const TaskProAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  List<Widget> _buildActions() {
    final excludedTitles = ["Aujourd'hui", "Prochainement", "", "Rechercher"];
    if (!excludedTitles.contains(title)) {
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
          onPressed: () {},
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

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
      actions: _buildActions()
    );
  }
}

// HugeIcon(
//   icon: HugeIcons.strokeRoundedTag01,
//   color: Colors.black,
//   size: 24.0,
// )