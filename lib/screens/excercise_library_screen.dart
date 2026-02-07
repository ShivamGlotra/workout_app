import 'package:flutter/material.dart';
import 'package:workout_app/constants/excercises.dart';
import 'package:workout_app/shared/widgets/excercise_widget.dart';

class ExcerciseLibraryScreen extends StatefulWidget {
  final bool reset;
  const ExcerciseLibraryScreen({super.key, required this.reset});

  @override
  State<ExcerciseLibraryScreen> createState() => _ExcerciseLibraryScreenState();
}

class _ExcerciseLibraryScreenState extends State<ExcerciseLibraryScreen> {
  bool showFilters = false;
  String searchQuery = "";
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
    "Legs": Colors.blue,
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
    // final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Header Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Exercise Library",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "${filteredExercises.length} exercises available",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                ),
              ],
            ),
          ),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onChanged: (value) {
                setState(() => searchQuery = value);
              },
              decoration: InputDecoration(
                hintText: "Search exercises...",
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() => searchQuery = "");
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          const SizedBox(height: 16),

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
                          selectedFilters.clear();
                          selectedFilters.addAll(allMuscles);
                        });
                      },
                      child: Text(
                        "Clear All",
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
                              label: Text(muscle),
                              selected: selectedFilters.contains(muscle),
                              onSelected: (selected) {
                                setState(() {
                                  selected
                                      ? selectedFilters.add(muscle)
                                      : selectedFilters.remove(muscle);
                                });
                              },
                              backgroundColor: Colors.grey.shade200,
                              selectedColor: muscleColors[muscle]?.withOpacity(
                                0.3,
                              ),
                              labelStyle: TextStyle(
                                color: selectedFilters.contains(muscle)
                                    ? muscleColors[muscle]
                                    : Colors.grey.shade700,
                                fontWeight: selectedFilters.contains(muscle)
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                              side: BorderSide(
                                color: selectedFilters.contains(muscle)
                                    ? muscleColors[muscle] ?? Colors.blue
                                    : Colors.transparent,
                                width: 1.5,
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
                : ExcerciseWidget(data: filteredExercises),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
