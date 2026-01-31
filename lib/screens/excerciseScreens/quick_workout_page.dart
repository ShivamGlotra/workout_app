import 'package:flutter/material.dart';
import 'package:workout_app/constants/excercises.dart';
import 'package:workout_app/shared/widgets/excercise_filter.dart';
import 'package:workout_app/shared/widgets/excercise_widget.dart';

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
        ExcerciseFilter(),
        ExcerciseWidget(data: chestExercises),
      ],
    );
  }
}
