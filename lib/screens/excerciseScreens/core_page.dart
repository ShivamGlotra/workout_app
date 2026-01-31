import 'package:flutter/material.dart';
import 'package:workout_app/constants/excercises.dart';
import 'package:workout_app/shared/widgets/excercise_filter.dart';
import 'package:workout_app/shared/widgets/excercise_widget.dart';

class CorePage extends StatefulWidget {
  const CorePage({super.key});

  @override
  State<CorePage> createState() => _CorePageState();
}

class _CorePageState extends State<CorePage> {
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
