// This page is going to display calories for the workout. Make sure it is same for the exercise detail screen
import 'package:flutter/material.dart';
import 'package:workout_app/screens/exercise_details_screen.dart';
import 'package:workout_app/screens/start_workout_flow/choose_new_workout.dart';
import 'package:workout_app/widgets/info_widget_planned_exc_screen.dart';

class PlannedExerciseList extends StatefulWidget {
  final List<String> exerciseFilters;
  const PlannedExerciseList({required this.exerciseFilters, super.key});

  @override
  State<PlannedExerciseList> createState() => _PlannedExerciseListState();
}

class _PlannedExerciseListState extends State<PlannedExerciseList>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> tabNames = ["Beginner", "Intermediate", "Advanced"];
  final List<String> descriptionForEachLevel = [
    "Focus on learning proper form and building a solid foundation with these simple, beginner-friendly movements.",
    "Take your fitness further and build real endurance and strength with these progressively challenging workouts.",
    "Push your limits and maximize power and performance with these high-intensity, demanding movements.",
  ];
  final List<Color> colorList = [
    Colors.blue[700]!,
    Colors.red[700]!,
    Colors.green[700]!,
    Colors.orange[700]!,
    Colors.purple[700]!,
    Colors.brown[700]!,
  ];
  int selectedTabIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        selectedTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Exercise Plan"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => {
                showDialog(
                  context: context,
                  builder: (context) => InformationWidgetPlannedExcScreen(),
                ),
              },
              icon: Icon(Icons.info, size: 20),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Column(
              children: [
                Divider(height: 1, thickness: 0, color: Colors.grey[300]),
                TabBar(
                  controller: _tabController,
                  dividerColor: Colors.transparent,
                  indicatorSize:
                      TabBarIndicatorSize.label, // shrinks to label width
                  labelColor: Colors.blue,
                  labelStyle: TextStyle(fontSize: 14),
                  indicatorColor: Colors.blue,
                  tabs: [
                    Tab(text: tabNames[0]),
                    Tab(text: tabNames[1]),
                    Tab(text: tabNames[2]),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            exerciseContainer(
              topDescription(
                tabNames[selectedTabIndex],
                "60 MINS",
                descriptionForEachLevel.first,
              ),
              widget.exerciseFilters.indexed
                  .map((entry) => exerciseTitle(entry.$2, colorList[entry.$1]))
                  .toList(),
              exerciseWidget(
                "Flat Bench Press",
                "assets/images/bench_press.jpg",
                "sets x reps",
                "120 kcal",
                Icon(Icons.ice_skating),
                Icon(Icons.ice_skating),
                "Details",
              ),
              navigatingButtons(
                Icon(Icons.arrow_forward_ios, size: 12),
                "Begin Session",
                "GO BACK",
                context,
              ),
            ),
            exerciseContainer(
              topDescription(
                tabNames[selectedTabIndex],
                "50 MINS",
                descriptionForEachLevel[1],
              ),
              widget.exerciseFilters
                  .map(
                    (excerciseName) => exerciseTitle(
                      excerciseName,
                      colorList[widget.exerciseFilters.indexOf(excerciseName)],
                    ),
                  )
                  .toList(),
              exerciseWidget(
                "Flat Bench Press",
                "assets/images/bench_press.jpg",
                "sets x reps",
                "120 kcal",
                Icon(Icons.ice_skating),
                Icon(Icons.ice_skating),
                "Details",
              ),
              navigatingButtons(
                Icon(Icons.arrow_forward_ios, size: 12),
                "Begin Session",
                "GO BACK",
                context,
              ),
            ),
            exerciseContainer(
              topDescription(
                tabNames[selectedTabIndex],
                "45 MINS",
                descriptionForEachLevel[2],
              ),
              widget.exerciseFilters
                  .map(
                    (excerciseName) => exerciseTitle(
                      excerciseName,
                      colorList[widget.exerciseFilters.indexOf(excerciseName)],
                    ),
                  )
                  .toList(),
              exerciseWidget(
                "Flat Bench Press",
                "assets/images/bench_press.jpg",
                "sets x reps",
                "120 kcal",
                Icon(Icons.ice_skating),
                Icon(Icons.ice_skating),
                "Details",
              ),
              navigatingButtons(
                Icon(Icons.arrow_forward_ios, size: 12),
                "Begin Session",
                "GO BACK",
                context,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget exerciseContainer(
    Widget top,
    List<Widget> muscleNames,
    Widget bottom,
    Widget buttonContainer,
  ) {
    final titles = muscleNames.isEmpty
        ? <Widget>[const SizedBox.shrink()]
        : muscleNames;

    return Padding(
      padding: EdgeInsets.all(20),
      child: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            child: ListView(
              children: [
                top,
                ...List.generate(
                  widget.exerciseFilters.length,
                  (index) => Column(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titles[index % titles.length],
                      bottom,
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                buttonContainer,
                SizedBox(height: MediaQuery.of(context).padding.bottom),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget topDescription(String heading, String time, String description) {
    return Column(
      spacing: 10,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 10,
              children: [
                Text(
                  heading,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.4,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                time,
                style: TextStyle(
                  color: Colors.blue[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        Text(
          description,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 14,
            height: 1.5,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget exerciseTitle(String excerciseName, Color containerColorName) {
    return Column(
      spacing: 10,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 10,
              children: [
                Container(
                  height: 20,
                  width: 4,
                  decoration: BoxDecoration(
                    color: containerColorName,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Text(
                  excerciseName,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.4,
                    color: Color(0xFF1a2340),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget exerciseWidget(
    String title,
    String exerciseImage,
    String setsAndReps,
    String totalKCal,
    Icon setFrequency,
    Icon kCal,
    String buttonName,
  ) {
    return GestureDetector(
      onLongPress: () => {
        showAboutDialog(
          context: context,
          children: [Text('Long pressed on $title')],
        ),
      },
      child: Container(
        width: double.infinity,
        // margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black.withAlpha(26)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                width: 130,
                height: 130,
                exerciseImage,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A233A),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    setsAndReps,
                    style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                  ),
                  Text(
                    totalKCal,
                    style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ExerciseDetailsScreen(exerciseName: title);
                        },
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 0,
                      ),
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          buttonName,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 10,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget exerciseDetailDialogScreen(){

  // }
}

Widget navigatingButtons(
  Icon icon,
  String proceedingButtonName,
  String backButtonName,
  BuildContext context,
) {
  return Column(
    children: [
      SizedBox(
        width: MediaQuery.widthOf(context) * .8,
        height: MediaQuery.heightOf(context) * .07,
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: WidgetStateProperty.all(2),
            shadowColor: WidgetStateProperty.all(Colors.black),
            backgroundColor: WidgetStateProperty.all(
              const Color.fromARGB(221, 18, 18, 18),
            ),
            foregroundColor: WidgetStateProperty.all(Colors.white),
            padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(vertical: 10),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          onPressed: () => {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Icon(Icons.arrow_right, size: 30),
              Text(
                "BEGIN SESSION",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text("GO BACK", style: TextStyle(color: Colors.grey[500])),
      ),
    ],
  );
}
