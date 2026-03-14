import 'package:flutter/material.dart';
import 'package:workout_app/constants/exercises.dart';

class ExerciseFilter extends StatelessWidget {
  const ExerciseFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: experienceLevel[0]["color"].withOpacity(0.2),
            fixedSize: const Size(100, 40),
          ),
          onPressed: () {},
          child: Text(
            experienceLevel[0]["name"],
            style: TextStyle(color: experienceLevel[0]["color"]),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: experienceLevel[1]["color"].withOpacity(0.2),
            fixedSize: const Size(110, 40),
          ),
          onPressed: () {},
          child: Text(
            experienceLevel[1]["name"],
            style: TextStyle(color: experienceLevel[1]["color"]),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: experienceLevel[2]["color"].withOpacity(0.2),
            fixedSize: const Size(100, 40),
          ),
          onPressed: () {},
          child: Text(
            experienceLevel[2]["name"],
            style: TextStyle(color: experienceLevel[2]["color"]),
          ),
        ),
      ],
    );
  }
}
