import 'package:flutter/material.dart';

class NewWorkoutRoute extends StatelessWidget {
  const NewWorkoutRoute({super.key});

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
              child: const Text('New Workout',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35)
              )
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Name:', style: TextStyle(color: Colors.grey, fontSize: 20)),
            )
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Workout 1',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(348, 20), primary: Colors.blue
              ),
              child: const Text('Submit', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
