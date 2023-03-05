import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class LogBook extends StatefulWidget {
  const LogBook({super.key});

  @override
  State<LogBook> createState() => _LogBookState();
}

class _LogBookState extends State<LogBook> {
  final currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2000, 01, 01),
      lastDay: DateTime(currentDate.year + 1, currentDate.month, currentDate.day),
      focusedDay: currentDate,
      headerStyle: const HeaderStyle(formatButtonVisible: false),
      calendarBuilders: CalendarBuilders(
        headerTitleBuilder: (context, day) {
          return Text( "${DateFormat('MMMM').format(day)} ${day.year}",
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center);
        },
      ),
    );
  }
}
