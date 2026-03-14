import 'package:flutter/material.dart';
import 'package:workout_app/constants/exercises.dart';
import 'package:workout_app/widgets/exercise_filter.dart';
import 'package:workout_app/widgets/exercise_widget.dart';

class LegPage extends StatefulWidget {
  const LegPage({super.key});

  @override
  State<LegPage> createState() => _LegPageState();
}

class _LegPageState extends State<LegPage> {
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
