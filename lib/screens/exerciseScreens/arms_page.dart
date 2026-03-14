import 'package:flutter/material.dart';
import 'package:workout_app/constants/exercises.dart';
import 'package:workout_app/widgets/exercise_filter.dart';
import 'package:workout_app/widgets/exercise_widget.dart';

class ArmsPage extends StatefulWidget {
  const ArmsPage({super.key});

  @override
  State<ArmsPage> createState() => _ArmsPageState();
}

class _ArmsPageState extends State<ArmsPage> {
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
