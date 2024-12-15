import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthAppBar extends StatelessWidget {
  final String chemin;
  const AuthAppBar({super.key, required this.chemin});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: TextButton.icon(
        onPressed: () {
          context.go(chemin); // Action de retour
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Color(0xFF3C3D3F),
        ),
        label: const Text(
          "Retour",
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF3C3D3F),
          ),
        ),
      ),
    );
  }
}
