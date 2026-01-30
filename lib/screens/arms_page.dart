import 'package:flutter/material.dart';
import 'package:workout_app/constants/excercises.dart';
import 'package:workout_app/shared/widgets/excercise_widget.dart';

class ArmsPage extends StatefulWidget {
  const ArmsPage({super.key});

  @override
  State<ArmsPage> createState() => _ArmsPageState();
}

class _ArmsPageState extends State<ArmsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: ExcerciseWidget(data: chestExercises));
  }
}
