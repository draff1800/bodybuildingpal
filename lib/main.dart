import 'package:bodybuildingpal/screens/profile.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BodybuildingPal());

class BodybuildingPal extends StatelessWidget {
  const BodybuildingPal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BodybuildingPal",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Color(0xfffafafa),
          centerTitle: true,
          elevation: 0
        )
      ),
      home: const Profile()
    );
  }
}
