import 'package:flutter/material.dart';
import 'package:workout_app/constants/excercises.dart';
import 'package:workout_app/shared/widgets/excercise_widget.dart';

class ChestPage extends StatefulWidget {
  const ChestPage({super.key});

  @override
  State<ChestPage> createState() => _ChestPageState();
}

class _ChestPageState extends State<ChestPage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: ExcerciseWidget(data: chestExercises));
  }
}
