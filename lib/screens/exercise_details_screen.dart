import 'package:flutter/material.dart';
import 'package:workout_app/screens/start_workout_flow/current_exercise_screen.dart';
import 'package:workout_app/widgets/tablikebuttons.dart';
import 'package:workout_app/widgets/video_player.dart';

class ExerciseDetailsScreen extends StatefulWidget {
  final String exerciseName;
  const ExerciseDetailsScreen({super.key, required this.exerciseName});

  @override
  State<ExerciseDetailsScreen> createState() => _ExerciseDetailsScreenState();
}

class _ExerciseDetailsScreenState extends State<ExerciseDetailsScreen> {
  // future enhancement
  // final Map<String, int> customizeExerciseOptions = {
  //   "Sets": 3,
  //   "Reps": 8,
  //   "Time Per Set": 60,
  // };
  int selectedTabIndex = 0;

  // Time must be different for different exercises and hence should be sent with the exercise data from the backend. For demo purposes, it's being calculated based on sets and reps.
  int totalTime = 0;
  static const int timeForEachExercise = 3;

  final Map<String, int> customizeExerciseOptions = {"Sets": 3, "Reps": 8};

  final int _maxSets = 10;
  final int _maxReps = 30;

  List<String> get listToBePassed => [
    customizeExerciseOptions["Sets"]!.toString(),
    customizeExerciseOptions["Reps"]!.toString(),
  ];

  void _applyTabPreset(int index) {
    selectedTabIndex = index;

    switch (index) {
      case 0:
        customizeExerciseOptions["Sets"] = 3;
        customizeExerciseOptions["Reps"] = 8;
        break;
      case 1:
        customizeExerciseOptions["Sets"] = 4;
        customizeExerciseOptions["Reps"] = 10;
        break;
      case 2:
        customizeExerciseOptions["Sets"] = 5;
        customizeExerciseOptions["Reps"] = 12;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exerciseName, style: TextStyle(fontSize: 16)),
        actions: [
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () => ()),
          IconButton(icon: Icon(Icons.add), onPressed: () => ()),
          PopupMenuButton<String>(
            itemBuilder: (context) => [
              PopupMenuItem(value: "rate", child: Text("Rate")),
              PopupMenuItem(value: "suggest", child: Text("Suggest Edit")),
              PopupMenuItem(value: "donate", child: Text("Donate")),
              PopupMenuItem(value: "report", child: Text("Report")),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      height: MediaQuery.heightOf(context) * .23,
                      width: MediaQuery.widthOf(context) * .9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage('assets/images/shoulder_press.gif'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Card(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () => {
                          showDialog(
                            context: context,
                            builder: (_) => CustomVideoPlayer(
                              videoUrl:
                                  "https://www.youtube.com/watch?v=2yjwXTZQDDI",
                            ),
                          ),
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.play_circle,
                                  color: const Color.fromARGB(255, 231, 96, 87),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "Watch Video Tutorial (2:26)",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.widthOf(context) * .9,
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 10,
                      children: [
                        tagChip("Compound", Icon(Icons.electric_bolt)),
                        tagChip("Beginner Friendly", Icon(Icons.assistant)),
                        tagChip("Compound", Icon(Icons.workspace_premium)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      titleCards("PRIMARY MUSCLE", "QUADS"),
                      titleCards("SECONDARY", "Glutes"),
                      titleCards("DIFFICULTY", "Intermediate"),
                      titleCards("EQUIPMENT", "Barbell"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: instructionBox("How to Perform", [
                        instructionStep(
                          "1",
                          "Set the Bar",
                          "Adjust the barbell height...",
                        ),
                        const SizedBox(height: 20),
                        instructionStep(
                          "2",
                          "Unrack & Position",
                          "Lift the bar off the rack...",
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: MediaQuery.widthOf(context) * .89,
                    height: MediaQuery.heightOf(context) * .07,
                    child: ElevatedButton.icon(
                      onPressed: () => (showModalBottomSheet(
                        context: context,
                        builder: (_) => StatefulBuilder(
                          builder: (context, setModalState) =>
                              configExerciseBottomSheet(setModalState),
                        ),
                      )),
                      icon: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: Color(0xFF000000), // High-vis neon lime
                          size: 16,
                        ),
                      ),
                      label: const Text(
                        "START EXERCISE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w900, // Extra bold
                          letterSpacing: 2.0, // Spaced out letters
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black, // High-vis neon lime
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            16,
                          ), // Rounded corners
                        ),
                        elevation: 0, // Flat look as seen in modern gym apps
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget tagChip(String tagLabel, Icon tagIcon) {
    return Chip(
      avatar: Icon(tagIcon.icon, color: const Color(0xFF2ECC71)),
      label: Text(tagLabel),
      padding: EdgeInsets.all(6),
      labelPadding: const EdgeInsets.symmetric(horizontal: 6),
      backgroundColor: const Color(0xFFF2F3F5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );
  }

  Widget titleCards(String title, String subTitle) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(14),
        child: SizedBox(
          width: MediaQuery.widthOf(context) * .35,
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xFF707070),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                subTitle,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF1A1C1E),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget instructionBox(String heading, List<Widget> steps) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: MediaQuery.widthOf(context) * .8,
          margin: const EdgeInsets.only(
            top: 30,
          ), // Room for the text to sit on top
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.black,
                width: 2,
              ), // The line text sits on
            ),
          ),
          child: Column(children: steps),
        ),

        Positioned(
          child: Container(
            padding: const EdgeInsets.only(right: 8),
            child: Text(
              heading.toUpperCase(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget instructionStep(String stepNumber, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: Colors.black,
          child: Text(
            stepNumber,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget configExerciseBottomSheet(StateSetter setModalState) {
    totalTime = customizeExerciseOptions["Sets"]! * timeForEachExercise;
    return Container(
      padding: const EdgeInsets.all(20),
      width: MediaQuery.widthOf(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          rowDataWidget(
            "Configure Exercise",
            "Expected Time",
            20,
            12,
            FontWeight.bold,
            FontWeight.w500,
            Colors.blue[800],
          ),
          rowDataWidget(
            "Personalize your session",
            "$totalTime mins",
            14,
            20,
            FontWeight.w300,
            FontWeight.bold,
            Colors.blue[800],
          ),
          SizedBox(height: 20),
          TabButtons(
            selectedTabIndex: selectedTabIndex,
            onTabSelected: (index) => setModalState(() {
              _applyTabPreset(index);
            }),
          ),
          SizedBox(height: 40),

          ...customizeExerciseOptions.entries.toList().asMap().entries.map((
            entry,
          ) {
            final index = entry.key;
            final e = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    e.key,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  counterRow(
                    "",
                    e.value,
                    true,
                    20,
                    16,
                    FontWeight.bold,
                    FontWeight.w500,
                    Colors.black,
                    e.key,
                    setModalState,
                    index == 0 ? _maxSets : _maxReps,
                  ),
                ],
              ),
            );
          }),

          SizedBox(height: 40),
          SizedBox(
            width: MediaQuery.widthOf(context) * .9,
            height: MediaQuery.heightOf(context) * .06,
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
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () => (Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CurrentExerciseScreen(
                    exerciseList: [widget.exerciseName],
                    customSetAndReps: listToBePassed,
                    userLevel: 0,
                  ),
                ),
              )),
              child: Text(
                "Proceed",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget rowDataWidget(
    String? heading,
    String subheading,
    double? headingFontSize,
    double subheadingFontSize,
    FontWeight? headingFontWeight,
    FontWeight? subheadingFontWeight,
    Color? subheadingColor,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          heading ?? '',
          style: TextStyle(
            fontSize: headingFontSize,
            fontWeight: headingFontWeight,
          ),
        ),
        Text(
          subheading.toString(),
          style: TextStyle(
            fontSize: subheadingFontSize,
            fontWeight: subheadingFontWeight,
            color: subheadingColor,
          ),
        ),
      ],
    );
  }

  Widget counterRow(
    String? heading,
    int subheading,
    bool showCounter,
    double? headingFontSize,
    double subheadingFontSize,
    FontWeight? headingFontWeight,
    FontWeight? subheadingFontWeight,
    Color? subheadingColor,
    String? key,
    StateSetter? setModalState,
    int maxValue,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 20,
      children: [
        Text(
          heading ?? '',
          style: TextStyle(
            fontSize: headingFontSize,
            fontWeight: headingFontWeight,
          ),
        ),
        if (showCounter)
          _counterActionButton(
            icon: Icons.remove,
            onTap: () => setModalState?.call(() {
              if (key != null && customizeExerciseOptions[key]! > 0) {
                customizeExerciseOptions[key] =
                    customizeExerciseOptions[key]! - 1;
              }
            }),
          ),
        Text(
          subheading.toString(),
          style: TextStyle(
            fontSize: subheadingFontSize,
            fontWeight: subheadingFontWeight,
            color: subheadingColor,
          ),
        ),
        if (showCounter)
          _counterActionButton(
            icon: Icons.add,
            onTap: () => setModalState?.call(() {
              if (key != null && customizeExerciseOptions[key]! < maxValue) {
                customizeExerciseOptions[key] =
                    customizeExerciseOptions[key]! + 1;
              }
            }),
          ),
      ],
    );
  }

  Widget _counterActionButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.grey.shade300,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: MediaQuery.widthOf(context) * .1,
          height: MediaQuery.heightOf(context) * .045,
          child: Icon(icon),
        ),
      ),
    );
  }
}
