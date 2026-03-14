import 'package:flutter/material.dart';
import 'package:workout_app/constants/exercises.dart';
import 'package:workout_app/widgets/exercise_filter.dart';
import 'package:workout_app/widgets/exercise_widget.dart';

class ChestPage extends StatefulWidget {
  const ChestPage({super.key});

  @override
  State<ChestPage> createState() => _ChestPageState();
}

class _ChestPageState extends State<ChestPage> {
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
