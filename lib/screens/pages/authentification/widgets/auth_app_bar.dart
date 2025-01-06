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
          color: Color(0xFF3C3D3F), size: 24,
        ),
        label: const Text(
          "Retour",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
    );
  }
}
