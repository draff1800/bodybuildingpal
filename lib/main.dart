import 'package:bodybuildingpal/screens/profile.dart';
import 'package:bodybuildingpal/screens/home/home_navigation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './constants/app_colours.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool existingUser = (prefs.getString('gender') != null &&
      prefs.getString('gender') != '' &&
      prefs.getString('dob') != null &&
      prefs.getString('dob') != '' &&
      prefs.getString('height') != null &&
      prefs.getString('height') != '');

  runApp(MaterialApp(
      title: "BodybuildingPal",
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          appBarTheme: const AppBarTheme(
              foregroundColor: AppColours.black,
              backgroundColor: AppColours.white,
              centerTitle: true,
              elevation: 0),
          scaffoldBackgroundColor: AppColours.grey1),
      home: existingUser ? const HomeNavigation() : const Profile()));
}
