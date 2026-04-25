import 'package:flutter/material.dart';
import 'package:workout_app/constants/exercises.dart';
import 'package:workout_app/widgets/exercise_list_header.dart';
import 'package:workout_app/widgets/exercise_widget.dart';
import 'package:workout_app/widgets/filter_chips.dart';
import 'package:workout_app/widgets/gradient_title.dart';
import 'package:workout_app/widgets/search_bar.dart';

class ChestPage extends StatefulWidget {
  const ChestPage({super.key});

  @override
  State<ChestPage> createState() => _ChestPageState();
}

class _ChestPageState extends State<ChestPage> {
  final TextEditingController searchFieldController = TextEditingController();
  // final screenWidth = MediaQuery.of(context).size.width;
  final Map<String, Color> allFilters = {
    "Beginner": ?Colors.green[800],
    "Intermediate": ?Colors.blue[800],
    "Advanced": ?Colors.red[800],
  };
  final Set<String> selectedFilters = {"Beginner", "Intermediate", "Advanced"};

  final List<String> headerData = [
    "BUILD",
    "BIG CHEST.",
    "Thick, powerful pecs aren't built by accident. Every press, every fly — with intent.",
  ];

  @override
  void dispose() {
    searchFieldController.dispose();
    super.dispose();
  }

  Map<String, List<ListItemData>> getFilteredData(
    List<ListItemData> filteredExercises,
  ) {
    final excerciseListByExperienceLevel = <String, List<ListItemData>>{};
    for (var exercise in filteredExercises) {
      excerciseListByExperienceLevel
          .putIfAbsent(exercise.experienceLevel, () => [])
          .add(exercise);
    }
    return excerciseListByExperienceLevel;
  }

  @override
  Widget build(BuildContext context) {
    final filteredExercises = chestExercises.where((exercise) {
      final matchesSearch = exercise.title.toLowerCase().contains(
        searchFieldController.text.toLowerCase(),
      );
      final matchesFilter = selectedFilters.contains(exercise.experienceLevel);
      return matchesSearch && matchesFilter;
    }).toList();
    return Column(
      spacing: 15,
      children: [
        ExerciseHeaderSection(heading: headerData),
        CustomSearchBar(
          searchFieldController: searchFieldController,
          hintText: "Search Exercise .....",
        ),
        CustomFilterChips(
          allFilters: allFilters,
          selectedFilters: selectedFilters,
          onChanged: (updatedFilters) => setState(() {
            selectedFilters.addAll(updatedFilters);
          }),
        ),

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
    );
  }

  Widget muscleList(List<ListItemData> filteredExercises) {
    // final excerciseListByExperienceLevel = <String, List<ListItemData>>{};
    final excerciseListByExperienceLevel = getFilteredData(filteredExercises);
    return Column(
      children: excerciseListByExperienceLevel.entries.map((entry) {
        final experienceLevel = entry.key;
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
                      containerColorName: allFilters[experienceLevel],
                      muscleName: experienceLevel,
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
