import 'package:flutter/material.dart';
import 'package:workout_app/screens/start_workout_flow/planned_exercise_list.dart';
import 'package:workout_app/widgets/info_widget_landing_screen.dart';
import 'package:workout_app/widgets/error_message.dart';
import 'package:workout_app/widgets/excercise_tile_startworkout_screen.dart';

class ChooseNewWorkout extends StatefulWidget {
  const ChooseNewWorkout({super.key});

  @override
  State<ChooseNewWorkout> createState() => _ChooseNewWorkoutState();
}

class _ChooseNewWorkoutState extends State<ChooseNewWorkout> {
  bool _noFilterSelected = false;
  final List<Map<String, dynamic>> exercises = [
    {"title": "CHEST", "icon": Icons.fitness_center},
    {"title": "BACK", "icon": Icons.fitness_center},
    {"title": "SHOULDERS", "icon": Icons.directions_run},
    {"title": "LEGS", "icon": Icons.sports_martial_arts},
    {"title": "ARMS", "icon": Icons.sports_handball},
    {"title": "CORE", "icon": Icons.accessibility_new},
  ];

  final Set<String> exerciseFilters = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Muscles"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => const InformationWidget(),
            ),
            icon: const Icon(Icons.info, size: 20),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, thickness: 0, color: Colors.grey[300]),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    "What are you training today?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text(
                      "Select the muscle group you want to focus on for this session.",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: _clearAll,
                        style: TextButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,
                          foregroundColor: Colors.grey,
                          backgroundColor: Colors.transparent,
                          overlayColor: Colors.transparent,
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                        ),
                        child: const Text(
                          "Clear All",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextButton(
                        onPressed: _selectAll,
                        style: TextButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,
                          foregroundColor: Colors.blue,
                          backgroundColor: Colors.transparent,
                          overlayColor: Colors.transparent,
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                        ),
                        child: const Text(
                          "Select All",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // ── Responsive grid using LayoutBuilder ──────────────────
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final double gap = constraints.maxWidth > 600 ? 20 : 10;
                      // 2 columns always; card fills half the width minus gaps
                      const int columns = 2;
                      final double cardWidth =
                          (constraints.maxWidth - gap * (columns - 1)) /
                          columns;
                      // Keep a pleasant aspect ratio (width : height ≈ 1 : 0.78)
                      final double cardHeight = cardWidth * 0.78;

                      return Wrap(
                        spacing: gap,
                        runSpacing: gap,
                        children: exercises.map((data) {
                          return ExerciseTile(
                            data: data,
                            width: cardWidth,
                            height: cardHeight,
                            isSelected: exerciseFilters
                                .contains(data['title'].toString()),
                            onTap: () {
                              _toggleFilter(data['title'].toString());
                              setState(() => _noFilterSelected = false);
                            },
                          );
                        }).toList(),
                      );
                    },
                  ),
                  // ────────────────────────────────────────────────────────

                  const SizedBox(height: 50),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    height: MediaQuery.of(context).size.height * .07,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: WidgetStateProperty.all(2),
                        shadowColor:
                            WidgetStateProperty.all(Colors.black87),
                        backgroundColor: WidgetStateProperty.all(
                          const Color.fromARGB(221, 58, 57, 57),
                        ),
                        foregroundColor:
                            WidgetStateProperty.all(Colors.white),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (exerciseFilters.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlannedExerciseList(
                                exerciseFilters: exerciseFilters.toList(),
                              ),
                            ),
                          );
                        } else {
                          setState(() => _noFilterSelected = true);
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Continue",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                  if (_noFilterSelected) ...[
                    const SizedBox(height: 15),
                    errorMessage("Please select at least one muscle group."),
                  ],
                  SizedBox(
                    height: MediaQuery.of(context).padding.bottom + 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _toggleFilter(String muscle) {
    setState(() {
      if (exerciseFilters.contains(muscle)) {
        exerciseFilters.remove(muscle);
      } else {
        exerciseFilters.add(muscle);
      }
    });
  }

  void _selectAll() {
    setState(() {
      exerciseFilters
          .addAll(exercises.map((e) => e['title'].toString()));
      _noFilterSelected = false;
    });
  }

  void _clearAll() {
    setState(() => exerciseFilters.clear());
  }
}

