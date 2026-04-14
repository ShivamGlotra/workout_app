import 'package:flutter/material.dart';
import 'package:workout_app/constants/exercises.dart';
import 'package:workout_app/widgets/exercise_flitered_list.dart';
import 'package:workout_app/widgets/exercise_widget.dart';

class ShouldersPage extends StatefulWidget {
  const ShouldersPage({super.key});

  @override
  State<ShouldersPage> createState() => _ShouldersPageState();
}

class _ShouldersPageState extends State<ShouldersPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [ExerciseWidget(data: chestExercises)]);
  }
}
