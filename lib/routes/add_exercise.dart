import 'package:bodybuildingpal/routes/exercise_card.dart';
import 'package:flutter/material.dart';
import '../../database/sql_helper.dart';
import '../../constants.dart' as constants;

class AddExerciseRoute extends StatefulWidget {
  const AddExerciseRoute({Key? key}) : super(key: key);

  @override
  State<AddExerciseRoute> createState() => _AddExerciseRouteState();
}

class _AddExerciseRouteState extends State<AddExerciseRoute> {
  List<Map<String, dynamic>> _exercises = [];
  bool _isLoading = true;

  void _getExercises() async {
    final data = await SQLHelper.getAll(constants.exercisesTableName);
    setState(() {
      _exercises = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BodybuildingPal'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.fromLTRB(20, 15, 0, 0),
              child: const Text('Add Exercise',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35))),
          _isLoading
              ? Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.fromLTRB(0, 275, 0, 275),
                  child: const CircularProgressIndicator())
              : _exercises.isEmpty
                  ? Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(0, 275, 0, 275),
                      child: const Text('Tap below to create an exercise.',
                          style: TextStyle(color: Colors.grey)))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (var exercise in _exercises)
                          GestureDetector(
                              onTapUp: (tapInfo) => {},
                              child: ExerciseCard(exercise['name']))
                      ],
                    ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'New Exercise',
        child: const Icon(Icons.add),
      ),
    );
  }
}
