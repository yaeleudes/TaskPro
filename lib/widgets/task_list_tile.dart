import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:task_pro/constants/task_pro_color.dart';

class TaskListTile extends StatelessWidget {
  final String title;
  final String description;
  const TaskListTile({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: TaskProColor.third),
        borderRadius: BorderRadius.circular(6)
      ),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontSize: 16),),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (description.isNotEmpty)
              Text(description, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),),
            Container(
              margin: const EdgeInsets.only(top: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const HugeIcon(
                        icon: HugeIcons.strokeRoundedCalendar02,
                        color: Colors.black,
                        size: 14.0,
                      ),
                      const Text("14 Déc. 14:30", style: TextStyle(fontSize: 12),),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                        margin: const EdgeInsets.only(left: 4),
                        decoration: BoxDecoration(
                          color: TaskProColor.red,
                          borderRadius: BorderRadius.circular(4)
                        ),
                        child: const Text("A faire", style: TextStyle(fontSize: 12, color: Colors.white),),
                      )
                    ],
                  ),
                  Row(children: [const Text('Education', style: TextStyle(fontSize: 12),), const SizedBox(width: 4,),Image.asset("assets/icons/education.png", width: 20,)],)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
