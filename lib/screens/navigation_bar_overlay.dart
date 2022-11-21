import 'package:flutter/material.dart';
import 'package:bodybuildingpal/screens/logbook.dart';
import 'insights.dart';

class NavigationBarOverlay extends StatefulWidget {
  const NavigationBarOverlay({super.key});

  @override
  State<NavigationBarOverlay> createState() => _NavigationBarOverlayState();
}

class _NavigationBarOverlayState extends State<NavigationBarOverlay> {
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
        appBar: AppBar(),
        body: Center(
          child: _navigationBarOverlayOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
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
        ));
  }
}
