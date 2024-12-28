import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:task_pro/widgets/task_list_tile.dart';

import '../../constants/task_pro_color.dart';
import '../../models/task.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({super.key});

  @override
  State<AgendaPage> createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime? _selectedDay = DateTime.now();
  final ScrollController _scrollController = ScrollController();
  int _expandedIndex = -1;

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _focusedDay = focusedDay;
        _selectedDay = selectedDay;
        _expandedIndex = selectedDay.difference(DateTime.now()).inDays + 1;
      });
      print(_selectedDay!.toIso8601String());
      print(_expandedIndex);

      // final index = selectedDay.difference(DateTime.now()).inDays;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        // final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
        // final itemHeight = renderBox?.size.height ?? 56.0;
        _scrollController.animateTo(
          _expandedIndex * 56.0,
          // index * 56.0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: TaskProColor.third))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TableCalendar(
                headerVisible: true,
                weekNumbersVisible: false,
                locale: 'fr_FR',
                focusedDay: _focusedDay,
                firstDay: DateTime.now(),
                lastDay: DateTime.utc(2030, 3, 14),
                calendarFormat: _calendarFormat,
                availableCalendarFormats: const {
                  CalendarFormat.week: 'Semaine',
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

              Container(
                width: size.width * .08,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: TaskProColor.third,
                  borderRadius: BorderRadius.circular(4)
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: 31, 
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final date = DateTime.now().add(Duration(days: index));

              final tasksForDate = Task.tasks.where((task) {
                final taskDate = task.dateEnd;
                return isSameDay(taskDate, date);
              }).toList();

              return ExpansionTile(
                childrenPadding: const EdgeInsets.only(bottom: 8, left: 10, right: 10),
                initiallyExpanded: index == _expandedIndex,
                showTrailingIcon: false,
                onExpansionChanged: (isExpanded) {
                  if (isExpanded) {
                    setState(() {
                      _focusedDay = date;
                      _selectedDay = date;
                    });
                    print("Jour selectionné est : $_selectedDay");
                  }
                },
                shape: Border(top: BorderSide(color: TaskProColor.third)),
                collapsedShape: Border(top: BorderSide(color: TaskProColor.third)),
                title: Text(DateFormat('dd MMM yyyy - EEEE', 'fr_FR').format(date)),
                children: tasksForDate.map((task) {
                  return TaskListTile(task: task);
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}
