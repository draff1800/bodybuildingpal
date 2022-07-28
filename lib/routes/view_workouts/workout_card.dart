import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final String workoutName;
  const WorkoutCard(this.workoutName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          side: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  workoutName,
                  style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20
                  )
                ),
              ),
              const Divider(height: 15, thickness: 1, color: Colors.black),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Workout details...',
                  style: TextStyle(fontSize: 15, color: Colors.grey)
                )
              ),
            ],
          ),
        )
    );
  }
}
