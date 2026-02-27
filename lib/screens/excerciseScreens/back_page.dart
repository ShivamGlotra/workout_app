import 'package:flutter/material.dart';
import 'package:workout_app/constants/excercises.dart';
import 'package:workout_app/widgets/excercise_filter.dart';
import 'package:workout_app/widgets/excercise_widget.dart';

class BackPage extends StatefulWidget {
  const BackPage({super.key});

  @override
  State<BackPage> createState() => _BackPageState();
}

class _BackPageState extends State<BackPage> {
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
