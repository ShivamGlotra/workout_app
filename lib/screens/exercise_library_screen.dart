import 'package:flutter/material.dart';
import 'package:workout_app/constants/exercises.dart';
import 'package:workout_app/widgets/exercise_widget.dart';
import 'package:workout_app/widgets/gradient_title.dart';

class ExerciseLibraryScreen extends StatefulWidget {
  const ExerciseLibraryScreen({super.key});

  @override
  State<ExerciseLibraryScreen> createState() => _ExerciseLibraryScreenState();
}

class _ExerciseLibraryScreenState extends State<ExerciseLibraryScreen> {
  bool showFilters = false;
  String searchQuery = "";

  final TextEditingController searchFieldController = TextEditingController();
  // final screenWidth = MediaQuery.of(context).size.width;

  @override
  void dispose() {
    searchFieldController.dispose();
    super.dispose();
  }

  final Set<String> selectedFilters = {
    "Chest",
    "Legs",
    "Back",
    "Shoulders",
    "Arms",
    "Core",
    "Cardio",
  };

  final List<String> allMuscles = [
    "Chest",
    "Legs",
    "Back",
    "Shoulders",
    "Arms",
    "Core",
    "Cardio",
  ];

  final Map<String, List<ListItemData>> exercisesByMuscle = {
    "Chest": chestExercises,
    "Legs": legsExercises,
    "Back": backExercises,
    "Shoulders": shouldersExercises,
    "Arms": armsExercises,
    "Core": coreExercises,
    "Cardio": cardioExercises,
  };

  final Map<String, IconData> muscleIcons = {
    "Chest": Icons.fitness_center,
    "Legs": Icons.downhill_skiing,
    "Back": Icons.back_hand,
    "Shoulders": Icons.waving_hand,
    "Arms": Icons.sports_gymnastics,
    "Core": Icons.account_balance,
    "Cardio": Icons.favorite,
  };

  final Map<String, Color> muscleColors = {
    "Chest": Colors.red,
    "Legs": Colors.indigoAccent,
    "Back": Colors.purple,
    "Shoulders": Colors.orange,
    "Arms": Colors.green,
    "Core": Colors.yellow,
    "Cardio": Colors.pink,
  };

  List<ListItemData> getFilteredExercises() {
    List<ListItemData> filtered = [];

    // Get exercises from selected muscle groups
    for (String muscle in selectedFilters) {
      if (exercisesByMuscle.containsKey(muscle)) {
        filtered.addAll(exercisesByMuscle[muscle]!);
      }
    }

    // Apply search filter
    if (searchQuery.isNotEmpty) {
      filtered = filtered
          .where(
            (exercise) => exercise.title.toLowerCase().contains(
              searchQuery.toLowerCase(),
            ),
          )
          .toList();
    }

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    final filteredExercises = getFilteredExercises();

    return SingleChildScrollView(
      child: Column(
        children: [
          // Header Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "PUSH YOUR  ",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                      TextSpan(
                        text: "LIMITS.",
                        style: TextStyle(
                          color: Colors.blue.shade600,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          fontFamily: 'italic',
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),
                Text(
                  "Browse our curated library of professional movements designed for maximum hypertrophy and functional strength.",
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 18,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: searchFieldController,
              style: const TextStyle(fontSize: 15),
              onChanged: (value) {
                setState(() => searchQuery = value);
              },
              decoration: InputDecoration(
                isDense: true,
                hintText: "Search exercises...",
                hintStyle: TextStyle(color: Colors.grey.shade600),
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                filled: true,
                fillColor: Colors.grey.shade200,
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            searchQuery = "";
                            searchFieldController.clear();
                          });
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
          const SizedBox(height: 30),

          // Quick Filter Chips
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Filter by Muscle",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilters.isNotEmpty
                              ? selectedFilters.clear()
                              : selectedFilters.addAll(allMuscles);
                        });
                      },
                      child: Text(
                        selectedFilters.isNotEmpty ? "Clear All" : "Select All",
                        style: TextStyle(
                          color: Colors.blue.shade600,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: allMuscles
                        .map(
                          (muscle) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: FilterChip(
                              showCheckmark: false,
                              label: Text(muscle),
                              selected: selectedFilters.contains(muscle),
                              onSelected: (selected) {
                                setState(() {
                                  selected
                                      ? selectedFilters.add(muscle)
                                      : selectedFilters.remove(muscle);
                                });
                              },
                              backgroundColor: Colors.white,
                              selectedColor: Colors.blue[600],
                              labelStyle: TextStyle(
                                letterSpacing: 1.3,
                                height: 1.5,
                                color: selectedFilters.contains(muscle)
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              shape: StadiumBorder(),
                              side: BorderSide(
                                color: selectedFilters.contains(muscle)
                                    ? Colors.blue[600]!
                                    : Colors.grey.shade300,
                                width: 1,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Exercise List or Empty State
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: filteredExercises.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 48),
                      child: Column(
                        children: [
                          Icon(
                            Icons.fitness_center,
                            size: 64,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "No exercises found",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Try adjusting your filters or search",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : muscleList(filteredExercises),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Map<String, List<ListItemData>> groupExercisesByMuscle(
    List<ListItemData> filteredExercises,
  ) {
    Map<String, List<ListItemData>> grouped = {};
    for (var exercise in filteredExercises) {
      if (!grouped.containsKey(exercise.muscleGroup)) {
        grouped[exercise.muscleGroup] = [];
      }
      grouped[exercise.muscleGroup]!.add(exercise);
    }
    return grouped;
  }

  Widget muscleList(List<ListItemData> filteredExercises) {
    final excerciseListByMuscle = groupExercisesByMuscle(filteredExercises);
    return Column(
      children: excerciseListByMuscle.entries.map((entry) {
        final muscle = entry.key;
        final exercises = entry.value;

        return Padding(
          padding: EdgeInsets.only(bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GradientTitle(
                      containerColorName: muscleColors[muscle],
                      muscleName: muscle,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "${exercises.length} exercises",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              ExerciseWidget(data: exercises),
            ],
          ),
        );
      }).toList(),
    );
  }
}
