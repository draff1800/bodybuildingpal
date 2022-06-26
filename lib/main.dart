import 'package:flutter/material.dart';
import 'add_workout.dart';

void main() => runApp(const BodybuildingPal());

class BodybuildingPal extends StatelessWidget {
  const BodybuildingPal({Key? key}) : super(key: key);

  static const String _title = 'Workouts';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const WorkoutsRoute(),
    );
  }
}

class WorkoutsRoute extends StatefulWidget {
  const WorkoutsRoute({Key? key}) : super(key: key);

  @override
  State<WorkoutsRoute> createState() => _WorkoutsRouteState();
}

class _WorkoutsRouteState extends State<WorkoutsRoute> {
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35))),
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(0, 275, 0, 275),
              child: const Text('Tap below to add a workout.',
                  style: TextStyle(color: Colors.grey))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => const AddWorkoutRoute())
          )
        },
        tooltip: 'Add Workout',
        child: const Icon(Icons.add),
      ),
    );
  }
}
