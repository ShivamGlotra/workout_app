import 'package:flutter/material.dart';
import 'package:workout_app/constants/excercises.dart';
import 'package:workout_app/shared/widgets/excercise_widget.dart';

class BackPage extends StatefulWidget {
  const BackPage({super.key});

  @override
  State<BackPage> createState() => _BackPageState();
}

class _BackPageState extends State<BackPage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: ExcerciseWidget(data: chestExercises));
  }
}
