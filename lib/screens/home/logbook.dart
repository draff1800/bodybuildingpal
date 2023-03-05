import 'package:bodybuildingpal/constants/app_colours.dart';
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: width*0.95, maxHeight: height*0.5),
      child: Container(
        decoration: BoxDecoration(
          color: AppColours.white,
          border: Border.all(color: AppColours.darkGrey2)
        ),
        child: TableCalendar(
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
        ),
      ),
    );
  }
}
