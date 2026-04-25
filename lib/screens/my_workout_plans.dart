import 'package:flutter/material.dart';
import 'package:workout_app/widgets/exercise_list_header.dart';
import 'package:workout_app/widgets/workout_plan_card.dart';

class MyWorkoutPlans extends StatefulWidget {
  const MyWorkoutPlans({super.key});

  @override
  State<MyWorkoutPlans> createState() => _MyWorkoutPlansState();
}

class _MyWorkoutPlansState extends State<MyWorkoutPlans> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.widthOf(context) * 0.9,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ExerciseHeaderSection(
                      heading: [
                        "Crush",
                        "Your Goals",
                        "Easily create, customize, and manage your workout plans in one place. Keep track of your exercises, sets, and progress so you can stay organized and consistent with your training.",
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.widthOf(context) * 0.87,
                      height: MediaQuery.heightOf(context) * 0.07,
                      child: ElevatedButton.icon(
                        onPressed: () => (
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Create New Plan"),
                              content: Text(
                                "New workout plan creation coming soon!",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text("Close"),
                                ),
                              ],
                            ),
                          ),
                        ),
                        icon: Icon(Icons.add, size: 20),
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            Colors.black.withAlpha(180),
                          ),
                          foregroundColor: WidgetStateProperty.all(
                            Colors.white,
                          ),

                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        label: Text(
                          'Create New Plan',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    WorkoutPlanCards(
                      workoutPlanData: [
                        "Beginner Full Body",
                        "Perfect starting point for fitness newcomers. Build foundational strength with simple"
                            "effective exercises.",
                        "Beginner",
                      ],
                      cardColors: [
                        const Color.fromARGB(255, 175, 247, 212),
                        const Color.fromARGB(255, 6, 107, 9),
                      ],
                      isComingFromWorkoutPlans: true,
                    ),
                    SizedBox(height: 15),
                    WorkoutPlanCards(
                      workoutPlanData: [
                        "Strength Builder",
                        "Intermediate program focused on building raw strength with compound movements.",
                        "intermediate",
                      ],
                      cardColors: [
                        const Color.fromARGB(255, 248, 224, 191),
                        const Color.fromARGB(255, 179, 108, 2),
                      ],
                      isComingFromWorkoutPlans: true,
                    ),
                    SizedBox(height: 15),
                    WorkoutPlanCards(
                      workoutPlanData: [
                        "Advance Athlete",
                        "High-intensity program for experienced lifters pushing their limits.",
                        "advanced",
                      ],
                      cardColors: [
                        const Color.fromARGB(255, 231, 185, 182),
                        const Color.fromARGB(255, 240, 22, 7),
                      ],
                      isComingFromWorkoutPlans: true,
                    ),
                    SizedBox(height: 15),
                    WorkoutPlanCards(
                      workoutPlanData: [
                        "{Custom Workout}",
                        "Perfect starting point for fitness newcomers. Build foundational strength with simple"
                            "effective exercises.",
                        "{custom plan}",
                      ],
                      cardColors: [
                        const Color.fromARGB(255, 157, 203, 241),
                        const Color.fromARGB(255, 2, 30, 78),
                      ],
                      isComingFromWorkoutPlans: true,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
