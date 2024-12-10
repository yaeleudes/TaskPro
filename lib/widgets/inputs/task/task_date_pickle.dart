import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class TaskDatePickle extends StatefulWidget {
  final String label;
  const TaskDatePickle({super.key, required this.label});

  @override
  State<TaskDatePickle> createState() => _TaskDatePickleState();
}

class _TaskDatePickleState extends State<TaskDatePickle> {
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
                  hintText: "Date d'échéance",
                  hintStyle: TextStyle(
                      color: Colors.black.withOpacity(.7),
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                  prefixIcon: const HugeIcon(
                    icon: HugeIcons.strokeRoundedCalendarAdd02,
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


        
  
  // Container(
  //           padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            // decoration: BoxDecoration(
            //   border: Border.all(),
            //   borderRadius: BorderRadius.circular(6)
            // ),
  //           child: Row(
  //             children: [
  //               const HugeIcon(
  //                 icon: HugeIcons.strokeRoundedCalendarAdd02,
  //                 color: Colors.black,
  //                 size: 24.0,
  //               ),

  //               Text(
  //                 "Date d'échéance", style: TextStyle(
  //                   color: Colors.black.withOpacity(.7),
  //                   fontSize: 13,
  //                   fontWeight: FontWeight.w400
  //                 ),
  //               )
  //             ],
  //           ),
  //         )