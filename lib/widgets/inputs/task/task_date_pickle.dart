import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import '../../modals/date_picking.dart';

class TaskDatePickle extends StatefulWidget {
  final Function(Map<String, dynamic>)? onDateSelected;
  const TaskDatePickle({super.key, this.onDateSelected});

  @override
  State<TaskDatePickle> createState() => _TaskDatePickleState();
}

class _TaskDatePickleState extends State<TaskDatePickle> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  Map<String, dynamic> result = {};

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () async {
        result = await showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            enableDrag: true,
            builder: (BuildContext context) {
              return DatePicking();
            });
        if (widget.onDateSelected != null) {
          print(selectedDate);
          setState(() {
            selectedDate = result['selectedDay'];
            selectedTime = result['selectedTime'];
          });
          print(selectedDate);
          widget.onDateSelected!(result);
        }
      },
      child: SizedBox(
        width: size.width * .38,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const HugeIcon(
                    icon: HugeIcons.strokeRoundedCalendarAdd02,
                    color: Colors.black,
                    size: 18.0,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    selectedDate != null
                        ? "${DateFormat('d MMM', 'fr_FR').format(selectedDate!)} ${selectedTime?.format(context) ?? ""}"
                        : "Date d'échéance",
                    style: TextStyle(
                      color: Colors.black.withOpacity(.7),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
