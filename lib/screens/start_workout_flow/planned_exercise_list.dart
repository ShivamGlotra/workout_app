import 'package:flutter/cupertino.dart';

class PlannedExerciseList extends StatefulWidget {
  final Set<String> exerciseFilters;

  const PlannedExerciseList({required this.exerciseFilters, super.key});

  @override
  State<PlannedExerciseList> createState() => _PlannedExerciseListState();
}

class _PlannedExerciseListState extends State<PlannedExerciseList> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
