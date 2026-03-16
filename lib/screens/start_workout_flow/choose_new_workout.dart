import 'package:flutter/material.dart';

class ChooseNewWorkout extends StatefulWidget {
  const ChooseNewWorkout({super.key});

  @override
  State<ChooseNewWorkout> createState() => _ChooseNewWorkoutState();
}

class _ChooseNewWorkoutState extends State<ChooseNewWorkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Workout"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => {}, icon: Icon(Icons.info, size: 20)),
        ],
      ),
    );
  }
}
