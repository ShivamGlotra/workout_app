import 'package:flutter/material.dart';
import 'package:workout_app/constants/exercises.dart';
import 'package:workout_app/widgets/exercise_filter.dart';
import 'package:workout_app/widgets/exercise_widget.dart';

class QuickWorkoutPage extends StatefulWidget {
  const QuickWorkoutPage({super.key});

  @override
  State<QuickWorkoutPage> createState() => _CardioPageState();
}

class _CardioPageState extends State<QuickWorkoutPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExerciseFilter(),
        ExerciseWidget(data: chestExercises),
      ],
    );
  }
}
