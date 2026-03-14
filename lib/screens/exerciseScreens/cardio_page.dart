import 'package:flutter/material.dart';
import 'package:workout_app/constants/exercises.dart';
import 'package:workout_app/widgets/exercise_filter.dart';
import 'package:workout_app/widgets/exercise_widget.dart';

class CardioPage extends StatefulWidget {
  const CardioPage({super.key});

  @override
  State<CardioPage> createState() => _CardioPageState();
}

class _CardioPageState extends State<CardioPage> {
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
