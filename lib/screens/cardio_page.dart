import 'package:flutter/material.dart';
import 'package:workout_app/constants/excercises.dart';
import 'package:workout_app/shared/widgets/excercise_widget.dart';

class CardioPage extends StatefulWidget {
  const CardioPage({super.key});

  @override
  State<CardioPage> createState() => _CardioPageState();
}

class _CardioPageState extends State<CardioPage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: ExcerciseWidget(data: chestExercises));
  }
}
