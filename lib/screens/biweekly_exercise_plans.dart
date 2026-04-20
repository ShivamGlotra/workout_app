import 'package:flutter/material.dart';
import 'package:workout_app/widgets/exercise_list_header.dart';
import 'package:workout_app/widgets/workout_plan_card.dart';

class BiWeeklyExercisePlans extends StatefulWidget {
  const BiWeeklyExercisePlans({super.key});

  @override
  State<BiWeeklyExercisePlans> createState() => _BiWeeklyExercisePlansState();
}

class _BiWeeklyExercisePlansState extends State<BiWeeklyExercisePlans> {
  final List<String> heading = [
    "Build",
    "In 14 Days",
    "Follow structured two-week training plans designed to boost strength, improve endurance, and keep you consistent. Stay focused with guided workouts built for real progress.",
  ];

  final List<List<String>> workoutPlanDataList = [
    [
      "14-Day Strength Kickstart",
      "A two-week program focused on building total-body strength through progressive compound lifts and structured recovery days.",
      "",
    ],
    [
      "Lean Muscle Builder",
      "A balanced 14-day training plan combining hypertrophy workouts and conditioning sessions to help build lean muscle mass.",
      "",
    ],
    [
      "Fat Burn Accelerator",
      "A high-energy two-week routine blending strength circuits, cardio, and core work to maximize calorie burn and endurance.",
      "",
    ],
    [
      "Upper Body Power Cycle",
      "A focused two-week split targeting chest, back, shoulders, and arms to improve upper body strength and definition.",
      "",
    ],
    [
      "Lower Body Growth Plan",
      "A progressive 14-day leg-focused program designed to develop quads, hamstrings, glutes, and calves.",
      "",
    ],
    [
      "Athletic Performance Boost",
      "A dynamic two-week plan combining strength, mobility, speed, and conditioning to improve overall athletic performance.",
      "",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Two-Week Training Plans"), centerTitle: true),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.widthOf(context) * 0.93,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ExerciseHeaderSection(heading: heading),
                        SizedBox(height: 20),
                        ...workoutPlanDataList.map(
                          (workoutPlanData) => Column(
                            children: [
                              WorkoutPlanCards(
                                workoutPlanData: workoutPlanData,
                                cardColors: [
                                  Colors.blue,
                                  Colors.green,
                                  Colors.orange,
                                ],
                                isComingFromWorkoutPlans: false,
                              ),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
