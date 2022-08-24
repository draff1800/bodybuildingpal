import 'package:bodybuildingpal/routes/view_workouts/workout_card.dart';
import 'package:flutter/material.dart';
import '../../database/sql_helper.dart';
import '../add_workout.dart';

class ViewWorkoutsRoute extends StatefulWidget {
  const ViewWorkoutsRoute({Key? key}) : super(key: key);

  @override
  State<ViewWorkoutsRoute> createState() => _ViewWorkoutsRouteState();
}

class _ViewWorkoutsRouteState extends State<ViewWorkoutsRoute> {
  List<Map<String, dynamic>> _workouts = [];
  bool _isLoading = true;
  Offset _tapPosition = Offset.zero;

  void _getTapPosition(TapDownDetails details) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    setState(() {
      _tapPosition = referenceBox.globalToLocal(details.globalPosition);
    });
  }

  void _getWorkouts() async {
    final data = await SQLHelper.getWorkouts();
    setState(() {
      _workouts = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getWorkouts();
  }

  void _showWorkoutMenu(BuildContext context, int workoutID) async {
    final RenderObject? overlay =
        Overlay.of(context)?.context.findRenderObject();

    final result = await showMenu(
        context: context,
        position: RelativeRect.fromRect(
            Rect.fromLTWH(_tapPosition.dx, _tapPosition.dy, 30, 30),
            Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width,
                overlay.paintBounds.size.height)),
        items: [
          const PopupMenuItem(
            value: 'delete',
            child: Text('Delete'),
          )
        ]);

    switch (result) {
      case 'delete':
        await SQLHelper.deleteWorkout(workoutID);
        _getWorkouts();
        break;
    }
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
                  child: const Text('Workouts',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35))),
              _isLoading
                  ? Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(0, 275, 0, 275),
                      child: const CircularProgressIndicator())
                  : _workouts.isEmpty
                      ? Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.fromLTRB(0, 275, 0, 275),
                          child: const Text('Tap below to add a workout.',
                              style: TextStyle(color: Colors.grey)))
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            for (var workout in _workouts)
                              GestureDetector(
                                  onTapDown: (tapInfo) => _getTapPosition(tapInfo),
                                  onLongPress: () =>
                                      _showWorkoutMenu(context, workout['id']),
                                  child: WorkoutCard(workout['name']))
                          ],
                        ),
            ],
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddWorkoutRoute()))
        },
        tooltip: 'Add Workout',
        child: const Icon(Icons.add),
      ),
    );
  }
}
