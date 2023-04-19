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

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ConstrainedBox(
        constraints: BoxConstraints(maxWidth: width * 0.95, maxHeight: height * 0.5),
        child: Container(
          decoration:
              BoxDecoration(color: AppColours.white, border: Border.all(color: AppColours.grey5)),
          child: TableCalendar(
            firstDay: DateTime.utc(2000, 01, 01),
            lastDay: DateTime(currentDate.year, currentDate.month + 1, currentDate.day),
            focusedDay: currentDate,
            headerStyle: const HeaderStyle(formatButtonVisible: false),
            calendarBuilders: CalendarBuilders(
              headerTitleBuilder: (context, day) {
                return Text("${DateFormat('MMMM').format(day)} ${day.year}",
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center);
              },
            ),
          ),
        ),
      ),
      Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 50),
          child: Column(children: [
            const Text('Daily Quicklog:', style: TextStyle(fontSize: 20)),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Column(children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: AppColours.yellow,
                          minimumSize: const Size(50, 50),
                          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0)),
                      child: const Icon(Icons.accessibility_rounded, color: Colors.white, size: 35),
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0), child: Text('Body'))
                  ]),
                  Column(children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: AppColours.green,
                          minimumSize: const Size(50, 50),
                          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0)),
                      child: const Icon(Icons.restaurant_rounded, color: Colors.white, size: 35),
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0), child: Text('Food'))
                  ]),
                  Column(children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: AppColours.red,
                          minimumSize: const Size(50, 50),
                          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0)),
                      child:
                          const Icon(Icons.fitness_center_rounded, color: Colors.white, size: 35),
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0), child: Text('Workout'))
                  ]),
                  Column(children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: AppColours.blue,
                          minimumSize: const Size(50, 50),
                          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0)),
                      child: const Icon(Icons.photo_camera_rounded, color: Colors.white, size: 35),
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0), child: Text('Photos'))
                  ]),
                ]))
          ])),
    ]);
  }
}
