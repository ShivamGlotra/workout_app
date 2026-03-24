import 'package:flutter/material.dart';
import 'package:workout_app/screens/start_workout_flow/planned_exercise_list.dart';
import 'package:workout_app/widgets/info_widget_landing_screen.dart';

class ChooseNewWorkout extends StatefulWidget {
  const ChooseNewWorkout({super.key});

  @override
  State<ChooseNewWorkout> createState() => _ChooseNewWorkoutState();
}

class _ChooseNewWorkoutState extends State<ChooseNewWorkout> {
  final List<Map<String, dynamic>> exercises = [
    {"title": "CHEST", "icon": Icons.fitness_center},
    {"title": "BACK", "icon": Icons.fitness_center},
    {"title": "SHOULDERS", "icon": Icons.directions_run},
    {"title": "LEGS", "icon": Icons.sports_martial_arts},
    {"title": "ARMS", "icon": Icons.sports_handball},
    {"title": "CORE", "icon": Icons.accessibility_new},
  ];

  // This set holds the filter selected by the user.
  final Set<String> exerciseFilters = {};

  // int _currentExerciseIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Muscles"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => {
              showDialog(
                context: context,
                builder: (context) => const InformationWidget(),
              ),
            },
            icon: Icon(Icons.info, size: 20),
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
              child: Container(
                padding: EdgeInsets.all(20),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.widthOf(context),
                ), // This needs to be fixed. Use Dynamic
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      "What are you training today?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: Text(
                        "Select the muscle group you want to focus on for this session.",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 14,
                          height: 1.2,
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => _clearAll(),
                          style: TextButton.styleFrom(
                            splashFactory: NoSplash.splashFactory,
                            foregroundColor: Colors.grey.withAlpha(255),
                            backgroundColor: Colors.transparent,
                            overlayColor: Colors.transparent,
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            "Clear All",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            splashFactory: NoSplash.splashFactory,
                            foregroundColor: Colors.blue,
                            backgroundColor: Colors.transparent,
                            overlayColor: Colors.transparent,
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () => _selectAll(),
                          child: Text(
                            "Select All",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Wrap(
                      spacing: MediaQuery.of(context).size.width > 600
                          ? 20
                          : 10,
                      runSpacing: 10,
                      children: [
                        ...exercises.asMap().entries.map((entry) {
                          var data = entry.value;
                          int index = entry.key;
                          return exerciseTileFilters(context, data, index);
                        }),
                      ],
                    ),

                    SizedBox(height: 50),
                    SizedBox(
                      width: MediaQuery.widthOf(context) * .8,
                      height: MediaQuery.heightOf(context) * .07,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: WidgetStateProperty.all(2),
                          shadowColor: WidgetStateProperty.all(Colors.black87),
                          backgroundColor: WidgetStateProperty.all(
                            const Color.fromARGB(221, 58, 57, 57),
                          ),
                          foregroundColor: WidgetStateProperty.all(
                            Colors.white,
                          ),
                          padding: WidgetStateProperty.all(
                            EdgeInsets.symmetric(
                              horizontal: MediaQuery.widthOf(context) * .25,
                              vertical: 10,
                            ),
                          ),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlannedExerciseList(
                                exerciseFilters: exerciseFilters,
                              ),
                            ),
                          ),
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Text(
                              "Continue",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 30,
                    ),
                  ],
                ),
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
    setState(
      () => exerciseFilters.addAll(
        exercises.map((exercise) => exercise['title'].toString()),
      ),
    );
  }

  void _clearAll() {
    setState(() => exerciseFilters.clear());
  }

  Widget exerciseTileFilters(
    BuildContext context,
    Map<String, dynamic> data,
    int index,
  ) {
    // bool isSelected = _currentExerciseIndex == index;
    return GestureDetector(
      onTap: () => _toggleFilter(data['title'].toString()),
      child: Container(
        width: 180,
        height: 140,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
          color: exerciseFilters.contains(data['title'].toString())
              ? Colors.blue[50]
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: exerciseFilters.contains(data['title'].toString())
                ? Colors.blue
                : Colors.grey.withAlpha(60),
            width: 1.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: exerciseFilters.contains(index)
                    ? Colors.blue.shade300
                    : Colors.grey.withAlpha(60),
                shape: BoxShape.circle,
              ),
              child: Icon(
                data['icon'],
                size: 25,
                color: exerciseFilters.contains(index)
                    ? Colors.white
                    : Colors.black87,
              ),
            ),
            Text(
              data['title'],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
