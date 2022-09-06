import 'package:flutter/material.dart';
import '../database/sql_helper.dart';
import 'view_workout.dart';
import '../constants.dart' as constants;

class NewWorkoutRoute extends StatelessWidget {
  NewWorkoutRoute({super.key});

  final TextEditingController _nameController = TextEditingController();

  Future<int> _addWorkout() async {
    return await SQLHelper.createWithName(constants.workoutsTableName, _nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('BodybuildingPal'),
      ),
      body: Column(
        children: <Widget>[
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.fromLTRB(20, 15, 0, 200),
              child: const Text('New Workout',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35))),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Name:',
                    style: TextStyle(color: Colors.grey, fontSize: 20)),
              )),
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
                _addWorkout().then((savedWorkoutId) {
                  Navigator.popUntil(context, ModalRoute.withName("/"));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ViewWorkoutRoute(savedWorkoutId)));
                });
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
