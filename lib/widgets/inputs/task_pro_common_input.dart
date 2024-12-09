import 'package:flutter/material.dart';

class TaskProCommonInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const TaskProCommonInput({super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hintText,
          focusColor: Colors.black,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(12)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(12)
          ),
            errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(12)
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(12)
          )
        ),
      ),
    );
  }
}
