import 'package:flutter/material.dart';
import 'package:workout_app/constants/exercises.dart';
import 'package:workout_app/widgets/exercise_list_header.dart';
import 'package:workout_app/widgets/exercise_widget.dart';
import 'package:workout_app/widgets/filter_chips.dart';
import 'package:workout_app/widgets/gradient_title.dart';
import 'package:workout_app/widgets/search_bar.dart';

class ExerciseLibraryScreen extends StatefulWidget {
  const ExerciseLibraryScreen({super.key});

  @override
  State<ExerciseLibraryScreen> createState() => _ExerciseLibraryScreenState();
}

class _ExerciseLibraryScreenState extends State<ExerciseLibraryScreen> {
  bool showFilters = false;
  String searchQuery = "";
  final List<String> headingData = [
    "PUSH YOUR",
    "LIMITS.",
    "Browse our curated library of professional movements designed for maximum hypertrophy and functional strength.",
  ];
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

  final Map<String, Color> allMuscles = {
    "Chest": ?Colors.blue[800],
    "Legs": ?Colors.blue[800],
    "Back": ?Colors.blue[800],
    "Shoulders": ?Colors.blue[800],
    "Arms": ?Colors.blue[800],
    "Core": ?Colors.blue[800],
    "Cardio": ?Colors.blue[800],
  };

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
          ExerciseHeaderSection(heading: headingData),
          const SizedBox(height: 20),

          // // Search Bar
          CustomSearchBar(
            searchFieldController: searchFieldController,
            onChanged: () {
              setState(() => searchQuery = searchFieldController.text);
            },
            onClear: () {
              setState(() => searchQuery = "");
            },
            hintText: "Search exercises...",
          ),
          const SizedBox(height: 30),

          // Quick Filter Chips
          CustomFilterChips(
            allFilters: allMuscles,
            selectedFilters: selectedFilters,
            onChanged: (updateFilters) {
              setState(() {
                selectedFilters.addAll(updateFilters);
              });
            },
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
                      containerColorName: allMuscles[muscle],
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
