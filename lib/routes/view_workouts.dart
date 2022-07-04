import 'package:flutter/material.dart';
import 'add_workout.dart';

class ViewWorkoutsRoute extends StatefulWidget {
  const ViewWorkoutsRoute({Key? key}) : super(key: key);

  @override
  State<ViewWorkoutsRoute> createState() => _ViewWorkoutsRouteState();
}

class _ViewWorkoutsRouteState extends State<ViewWorkoutsRoute> {
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
              child: const Text('Workouts',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35)
              )
            ),
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(0, 275, 0, 275),
              child: const Text('Tap below to add a workout.',
                  style: TextStyle(color: Colors.grey)
              )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => AddWorkoutRoute())
          )
        },
        tooltip: 'Add Workout',
        child: const Icon(Icons.add),
      ),
    );
  }
}
