import 'package:flutter/material.dart';
import '../database/sql_helper.dart';
import '../database/data_models/workout.dart';

class ViewWorkoutRoute extends StatefulWidget {
  const ViewWorkoutRoute({Key? key}) : super(key: key);

  @override
  State<ViewWorkoutRoute> createState() => _ViewWorkoutRouteState();
}

class _ViewWorkoutRouteState extends State<ViewWorkoutRoute> {
  String _workoutName = '';

  void _refreshWorkoutName() async {
    final data = await SQLHelper.getWorkout(1);
    final Workout workout = Workout(name: data[0]['name']);
    setState(() {
      _workoutName = workout.name;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshWorkoutName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BodybuildingPal'),
      ),
      body: Column(
        children: <Widget>[
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.fromLTRB(20, 15, 0, 0),
              child: Text(_workoutName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 35))),
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.fromLTRB(20, 5, 0, 0),
              child: const Text('Exercises', style: TextStyle(fontSize: 25))),
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(0, 240, 0, 275),
              child: const Text('Tap below to add an exercise.',
                  style: TextStyle(color: Colors.grey))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Add Exercise',
        child: const Icon(Icons.add),
      ),
    );
  }
}
