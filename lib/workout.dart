import 'package:flutter/material.dart';

class WorkoutRoute extends StatelessWidget {
  const WorkoutRoute({super.key});

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
              child: const Text('Workout 1',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35))
          ),
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.fromLTRB(20, 5, 0, 0),
              child: const Text('Exercises',
                  style: TextStyle(fontSize: 25))
          ),
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(0, 240, 0, 275),
              child: const Text('Tap below to add an exercise.',
                  style: TextStyle(color: Colors.grey))
          ),
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
