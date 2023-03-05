import 'package:flutter/material.dart';
import '../../constants/app_colours.dart';
import 'logbook.dart';
import 'insights.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({super.key});

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int _selectedIndex = 0;
  static const List<Widget> _navigationBarOverlayOptions = <Widget>[
    LogBook(),
    Insights(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: _navigationBarOverlayOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
                color: AppColours.darkGrey,
                border: Border(top: BorderSide(color: AppColours.darkGrey, width: 2))),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  label: 'Logbook',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.auto_graph_outlined),
                  label: 'Insights',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              backgroundColor: AppColours.grey,
            )));
  }
}
