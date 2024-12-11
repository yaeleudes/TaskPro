import 'package:flutter/material.dart';

class TaskTitleInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const TaskTitleInput({super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 38,
            child: TextFormField(
              controller: controller,
              maxLength: 255,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(.7),
                  fontWeight: FontWeight.w400,
                ),
                counterText: '',
                border: InputBorder.none
              ),
            ),
          ),
        ],
      ),
    );
  }
}