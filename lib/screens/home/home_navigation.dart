import 'package:flutter/material.dart';
import '../../constants/app_colours.dart';
import 'logbook.dart';
import 'insights.dart';
import '../profile.dart';

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
          backgroundColor: AppColours.grey1,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.account_circle_outlined, color: AppColours.grey4, size: 40),
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Profile()),
                );
              },
            )
          ],
        ),
        body: Center(
          child: _navigationBarOverlayOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
                color: AppColours.grey3,
                border: Border(top: BorderSide(color: AppColours.grey3, width: 2))),
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
              backgroundColor: AppColours.grey2,
            )));
  }
}
