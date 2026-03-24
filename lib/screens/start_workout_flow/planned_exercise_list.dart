import 'package:flutter/material.dart';
import 'package:workout_app/widgets/info_widget_planned_exc_screen.dart';

class PlannedExerciseList extends StatefulWidget {
  final Set<String> exerciseFilters;

  const PlannedExerciseList({required this.exerciseFilters, super.key});

  @override
  State<PlannedExerciseList> createState() => _PlannedExerciseListState();
}

class _PlannedExerciseListState extends State<PlannedExerciseList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercise Plan"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => {
              showDialog(
                context: context,
                builder: (context) => InformationWidgetPlannedExcScreen(),
              ),
            },
            icon: Icon(Icons.info, size: 20),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, thickness: 0, color: Colors.grey[300]),
        ),
      ),
      body: (Container()),
    );
  }
}
