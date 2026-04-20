import 'package:flutter/material.dart';
import 'package:workout_app/widgets/exercise_list_header.dart';
import 'package:workout_app/widgets/workout_plan_card.dart';

class MuscleGroupPlans extends StatefulWidget {
  const MuscleGroupPlans({super.key});

  @override
  State<MuscleGroupPlans> createState() => _MuscleGroupPlansState();
}

class _MuscleGroupPlansState extends State<MuscleGroupPlans> {
  final List<String> heading = [
    "Train",
    "Every Muscle",
    "Explore ready-made workout plans for chest, back, legs, shoulders, arms, and core. Follow targeted routines designed to help you build strength, stay consistent, and reach your fitness goals.",
  ];

  final List<List<String>> workoutPlanDataList = [
    [
      "Chest Body Blast",
      "A high-intensity workout targeting the chest, back, shoulders, and arms to build strength and muscle mass.",
      "",
    ],
    [
      "Leg Powerhouse",
      "A comprehensive leg workout designed to build strength and endurance in the quadriceps, hamstrings, glutes, and calves.",
      "",
    ],
    [
      "Core Strength Builder",
      "A focused workout plan to strengthen the core muscles, including the abdominals, obliques, and lower back, for improved stability and posture.",
      "",
    ],
    [
      "Shoulder Sculptor",
      "A targeted workout routine to build and tone the shoulder muscles, including the deltoids and rotator cuff, for enhanced upper body strength and aesthetics.",
      "",
    ],
    [
      "Arm Toning Circuit",
      "A dynamic workout plan designed to tone and strengthen the biceps, triceps, and forearms, using a combination of resistance exercises and bodyweight movements for sculpted arms.",
      "",
    ],
    [
      "Back Strength Builder",
      "A comprehensive workout plan focused on strengthening the back muscles, including the latissimus dorsi, rhomboids, and trapezius, to improve posture, enhance upper body strength, and support overall fitness goals.",
      "",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Muscle Plans"), centerTitle: true),
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
