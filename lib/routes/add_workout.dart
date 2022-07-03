import 'package:flutter/material.dart';
import '../database/sql_helper.dart';
import 'view_workout.dart';

class AddWorkoutRoute extends StatelessWidget {
  AddWorkoutRoute({super.key});

  final TextEditingController _nameController = TextEditingController();

  Future<void> _addWorkout() async {
    await SQLHelper.createWorkout(_nameController.text);
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
              margin: const EdgeInsets.fromLTRB(20, 15, 0, 200),
              child: const Text('Add Workout',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35)
              )
          ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Name:',
                    style: TextStyle(color: Colors.grey, fontSize: 20)),
              )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Workout 1',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ElevatedButton(
              onPressed: () {
                _addWorkout();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ViewWorkoutRoute()
                    )
                );
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(348, 20), primary: Colors.blue),
              child:
                  const Text('Submit', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}