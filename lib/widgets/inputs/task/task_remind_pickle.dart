import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class TaskRemindPickle extends StatefulWidget {
  final String? selectedRemind;
  final Function(String?) onSelectedRemind;
  const TaskRemindPickle({super.key, required this.selectedRemind, required this.onSelectedRemind});

  @override
  State<TaskRemindPickle> createState() => _TaskRemindPickleState();
}

class _TaskRemindPickleState extends State<TaskRemindPickle> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      child: SizedBox(
        width: size.width * .24,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
              decoration: BoxDecoration(
                  border: Border.all(), borderRadius: BorderRadius.circular(6)),
              child: PopupMenuButton<String>(
                onSelected: widget.onSelectedRemind,
                itemBuilder: (context) => [
                  const PopupMenuItem(value: "imm.", child: Text("Au moment de l’échéance"),),

                  const PopupMenuItem(value: "5 mins.", child: Text("5 minutes avant l’échéance"),),
                  const PopupMenuItem(value: "10 mins.", child: Text("10 minutes avant l’échéance"),),
                  const PopupMenuItem(value: "15 mins.", child: Text("15 minutes avant l’échéance"),),
                  const PopupMenuItem(value: "30 mins.", child: Text("30 minutes avant l’échéance"),),

                  const PopupMenuItem(value: "01 h.", child: Text("1 heure avant l’échéance"),),
                  const PopupMenuItem(value: "02 h.", child: Text("2 heure avant l’échéance"),),
                  const PopupMenuItem(value: "03 h.", child: Text("4 heure avant l’échéance"),),

                  const PopupMenuItem(value: "01 j.", child: Text("1 jour avant l’échéance"),),
                  const PopupMenuItem(value: "02 j.", child: Text("2 jours avant l’échéance"),),

                  const PopupMenuItem(value: "01 sem.", child: Text("1 semaine avant l’échéance"),),

                  const PopupMenuItem(value: "Stop.", child: Text("Heure personnalisée"),),
                ],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const HugeIcon(
                      icon: HugeIcons.strokeRoundedAlarmClock,
                      color: Colors.black,
                      size: 18.0,
                    ),
                    const SizedBox(width: 4,),
                    Text(
                      widget.selectedRemind!,
                      style: TextStyle(
                          color: Colors.black.withOpacity(.7),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
