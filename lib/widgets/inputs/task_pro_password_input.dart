import 'package:flutter/material.dart';

class TaskProPasswordInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  const TaskProPasswordInput(
      {super.key, required this.controller, required this.hintText});

  @override
  State<TaskProPasswordInput> createState() => _TaskProPasswordInputState();
}

class _TaskProPasswordInputState extends State<TaskProPasswordInput> {
  bool isVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextFormField(
        controller: widget.controller,
        cursorColor: Colors.black,
        obscureText: isVisible,
        obscuringCharacter: "*",
        decoration: InputDecoration(
          hintText: widget.hintText,
          focusColor: Colors.black,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(12)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(12)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(12)),
          suffixIcon:IconButton(
            onPressed: () {
              // Ici lorsque le bouton (l'oiel) est appuyé, la valeur de isVisible change
              setState(() {
                isVisible = !isVisible;
              });
            }, 
            icon: isVisible? const Icon(Icons.visibility_outlined, color: Colors.black) : const Icon(Icons.visibility_off_outlined, color: Colors.black)
          )
        ),
      ),
    );
  }
}
