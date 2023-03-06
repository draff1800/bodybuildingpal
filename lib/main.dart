import 'package:bodybuildingpal/screens/profile.dart';
import 'package:flutter/material.dart';
import './constants/app_colours.dart';

void main() => runApp(const BodybuildingPal());

class BodybuildingPal extends StatelessWidget {
  const BodybuildingPal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BodybuildingPal",
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        appBarTheme: const AppBarTheme(
          foregroundColor: AppColours.black,
          backgroundColor: AppColours.white,
          centerTitle: true,
          elevation: 0
        ),
        scaffoldBackgroundColor: AppColours.grey1
      ),
      home: const Profile()
    );
  }
}
