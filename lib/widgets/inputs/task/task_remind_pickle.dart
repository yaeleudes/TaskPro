import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class TaskRemindPickle extends StatefulWidget {
  final String label;
  const TaskRemindPickle({super.key, required this.label});

  @override
  State<TaskRemindPickle> createState() => _TaskRemindPickleState();
}

class _TaskRemindPickleState extends State<TaskRemindPickle> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * .42,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 38,
            child: TextFormField(
              readOnly: true,
              onTap: (){
                print("Date d'échéance");
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                  hintText: "Rappels",
                  hintStyle: TextStyle(
                      color: Colors.black.withOpacity(.7),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  prefixIcon: const HugeIcon(
                    icon: HugeIcons.strokeRoundedAlarmClock,
                    color: Colors.black,
                    size: 24.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(12)),
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 1.5),
                      borderRadius: BorderRadius.circular(12)),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(12))),
            ),
          )
        ],
      ),
    );
  }

}

