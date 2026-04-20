import 'package:flutter/material.dart';
import 'package:workout_app/screens/start_workout_flow/planned_exercise_list.dart';

class WorkoutPlanCards extends StatefulWidget {
  final List<String> workoutPlanData;
  final List<Color> cardColors;
  final bool isComingFromWorkoutPlans;
  const WorkoutPlanCards({
    required this.workoutPlanData,
    required this.cardColors,
    required this.isComingFromWorkoutPlans,
    super.key,
  });

  @override
  State<WorkoutPlanCards> createState() => _WorkoutPlanCardsState();
}

class _WorkoutPlanCardsState extends State<WorkoutPlanCards> {
  @override
  Widget build(BuildContext context) {
    final List<String> exerciseFilters = [widget.workoutPlanData[0]];
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.black26, width: 1.2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.isComingFromWorkoutPlans
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.workoutPlanData[0],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.edit_note_outlined, size: 28),
                        color: Colors.black87,
                        padding: EdgeInsets.zero,
                        style: IconButton.styleFrom(
                          minimumSize: Size(30, 30), // Shrinks the touch target
                          padding: EdgeInsets.all(
                            10,
                          ), // Tightens the space around the icon
                          tapTargetSize: MaterialTapTargetSize
                              .shrinkWrap, // Tells Flutter to ignore the 48px rule
                        ),
                        onPressed: () => (showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Edit Workout"),
                            content: Text("Edit workout details here."),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text("Cancel"),
                              ),
                            ],
                          ),
                        )),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete_forever_outlined, size: 25),
                        color: Colors.redAccent,
                        padding: EdgeInsets.zero,
                        style: IconButton.styleFrom(
                          minimumSize: Size(30, 30), // Shrinks the touch target
                          padding: EdgeInsets.all(
                            4,
                          ), // Tightens the space around the icon
                          tapTargetSize: MaterialTapTargetSize
                              .shrinkWrap, // Tells Flutter to ignore the 48px rule
                        ),
                        onPressed: () => (showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Delete Workout"),
                            content: Text(
                              "Are you sure you want to delete this workout?",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Add delete logic here
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Delete",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        )),
                      ),
                    ],
                  )
                : Text(
                    widget.workoutPlanData[0],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
            SizedBox(height: 8),
            widget.workoutPlanData[2].isNotEmpty
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: widget.cardColors[0],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      widget.workoutPlanData[2],
                      style: TextStyle(
                        color: widget.cardColors[1],
                        fontSize: 11,
                      ),
                    ),
                  )
                : SizedBox(),
            SizedBox(height: 15),
            Text(
              widget.workoutPlanData[1],
              style: TextStyle(color: Colors.black87, fontSize: 14),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20),
                Icon(Icons.watch_later_outlined, size: 20),
                SizedBox(width: 10),
                Text(
                  "4 weeks",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
                SizedBox(width: 70),
                Icon(Icons.watch_later_outlined, size: 20),
                SizedBox(width: 10),
                Text(
                  "3x per Week",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20),
                Icon(Icons.watch_later_outlined, size: 20),
                SizedBox(width: 10),
                Text(
                  "4 weeks",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
                SizedBox(width: 70),
                Icon(Icons.watch_later_outlined, size: 20),
                SizedBox(width: 10),
                Text(
                  "4 weeks",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.widthOf(context),
              child: TextButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PlannedExerciseList(exerciseFilters: exerciseFilters),
                    ),
                  ),
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                  foregroundColor: WidgetStateProperty.all(Colors.black),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.black38),
                    ),
                  ),
                ),
                child: Text(
                  'View Details',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
