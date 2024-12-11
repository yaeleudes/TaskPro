import 'package:flutter/material.dart';

class TaskDescription extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const TaskDescription({super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 60,
            child: TextFormField(
              controller: controller,
              maxLines: null,
              expands: true,
              maxLength: 500,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
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