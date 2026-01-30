import 'package:flutter/material.dart';
import 'package:workout_app/constants/excercises.dart';
import 'package:workout_app/shared/widgets/excercise_widget.dart';

class ShouldersPage extends StatefulWidget {
  const ShouldersPage({super.key});

  @override
  State<ShouldersPage> createState() => _ShouldersPageState();
}

class _ShouldersPageState extends State<ShouldersPage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: ExcerciseWidget(data: chestExercises));
  }
}
