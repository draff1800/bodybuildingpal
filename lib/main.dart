import 'package:flutter/material.dart';

void main() => runApp(const BodybuildingPal());

class BodybuildingPal extends StatelessWidget {
  const BodybuildingPal({Key? key}) : super(key: key);

  static const String _title = 'Workouts';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      home: const WorkoutsPageStatefulWidget(),
    );
  }
}

class WorkoutsPageStatefulWidget extends StatefulWidget {
  const WorkoutsPageStatefulWidget({Key? key}) : super(key: key);

  @override
  State<WorkoutsPageStatefulWidget> createState() => _WorkoutsPageStatefulWidgetState();
}

class _WorkoutsPageStatefulWidgetState extends State<WorkoutsPageStatefulWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BodybuildingPal'),
      ),
      body: 
        Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.fromLTRB(20, 15, 0, 0),
              child: const Text('Workouts', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35))
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(0, 275, 0, 275),
              child: const Text('There\'s nothing here... Yet!', style: TextStyle(color: Colors.grey))
            ),
          ],
        ),
      floatingActionButton: 
        FloatingActionButton(
          onPressed: () => {},
          tooltip: 'Add Workout',
          child: const Icon(Icons.add),
        ),
    );
  }
}
