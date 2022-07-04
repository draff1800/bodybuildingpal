import 'package:flutter/material.dart';
import './routes/view_workouts.dart';

void main() => runApp(const BodybuildingPal());

class BodybuildingPal extends StatelessWidget {
  const BodybuildingPal({Key? key}) : super(key: key);

  static const String _title = 'Workouts';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const ViewWorkoutsRoute(),
    );
  }
}