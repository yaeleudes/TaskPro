import 'package:flutter/material.dart';

class TaskTitleInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  const TaskTitleInput({super.key, required this.controller, required this.label, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 38,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(.7),
                  fontWeight: FontWeight.w400
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}
