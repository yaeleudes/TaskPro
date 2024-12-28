import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../constants/task_pro_color.dart';

class DatePicking extends StatefulWidget {

  const DatePicking({super.key});

  @override
  State<DatePicking> createState() => _DatePickingState();
}

class _DatePickingState extends State<DatePicking> {
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _selectedDay = DateTime.now(); 
  TimeOfDay? _selectedTime;
  
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _focusedDay = focusedDay;
        _selectedDay = selectedDay;
      });
      print(_selectedDay!.toIso8601String());
    }
  }

  Future _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      barrierDismissible: false,
      context: context,
      initialTime: TimeOfDay.now(),
      helpText: "Selectionnez une heure",
      cancelText: "Annuler",
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
      print(_selectedTime!.format(context));
    }
  }

  Future test () async {
    _selectTime(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 4),
              child: TableCalendar(
                headerVisible: true,
                weekNumbersVisible: false,
                locale: 'fr_FR',
                focusedDay: _focusedDay,
                firstDay: DateTime.now(),
                lastDay: DateTime.utc(2030, 3, 14),
                calendarFormat: _calendarFormat,
                availableCalendarFormats: const {
                  CalendarFormat.month: 'Mois',
                  CalendarFormat.twoWeeks: '2 Semaines',
                  CalendarFormat.week: 'Semaine'
                },
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    color: TaskProColor.secondary,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: TaskProColor.secondary.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                ),
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                startingDayOfWeek: StartingDayOfWeek.monday,
                onPageChanged: (focusedDay) {
                  setState(() {
                    _focusedDay = focusedDay;
                  });
                },
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: _onDaySelected
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(top: 8, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: _selectedTime == null ? test : null,
                    child: Container(
                      child: Row(
                        children: [
                          const HugeIcon(
                            icon: HugeIcons.strokeRoundedClock01,
                            color: Colors.black,
                            size: 24.0,
                          ),
                          const SizedBox(width: 8,),
                          if (_selectedTime == null)
                            const Text("Ajouter une heure")
                          else 
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  _selectedTime = null;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(4)
                                ),
                                child: Row(
                                  children: [
                                    Text(_selectedTime!.format(context)),
                                    const HugeIcon(
                                      icon: HugeIcons.strokeRoundedMultiplicationSign,
                                      color: Colors.black,
                                      size: 20.0,
                                    )
                                  ],
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
      
                  TextButton(
                    onPressed: (){
                      Navigator.pop(
                        context,
                        {
                          'selectedDay': _selectedDay,
                          'selectedTime': _selectedTime,
                        },
                      );
                    }, 
                    child: const Text(
                      "Continuer", 
                      style: TextStyle(fontSize: 16),
                    )
                  )
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  
  }
}
