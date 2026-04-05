import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrentExerciseScreen extends StatefulWidget {
  final List<String> exerciseList;
  const CurrentExerciseScreen({required this.exerciseList, super.key});

  @override
  State<CurrentExerciseScreen> createState() => _CurrentExerciseScreenState();
}

class _CurrentExerciseScreenState extends State<CurrentExerciseScreen> {
  int exerciseListIndex = 0;
  bool markCompleted = false;
  bool imageClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        titleSpacing: 0,
        leading: Icon(Icons.timer, color: Colors.blue),
        title: Text("24:15"),
        actions: [
          iconContainer(Icons.pause, Colors.grey),
          SizedBox(width: 10),
          iconContainer(Icons.stop, Colors.red),
        ],
        bottom: PreferredSize(
          preferredSize: Size.zero,
          child: Divider(height: 1.1, thickness: 0.2),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 28),
            child: Column(
              spacing: 10,
              children: [
                progressBar(widget.exerciseList.length, 7),
                currentExerciseContainer(
                  widget.exerciseList[2],
                  "Chest",
                  "assets/images/incline_press.jpg",
                  4,
                  12,
                ),
                SizedBox(height: 20),
                buttonsForTheScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget iconContainer(IconData iconName, Color colorName) {
    return Container(
      decoration: BoxDecoration(
        color: colorName.withAlpha(30),
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        highlightColor: Colors.transparent,
        visualDensity: VisualDensity.compact,
        icon: Icon(iconName),
        color: colorName,
        onPressed: () {},
      ),
    );
  }

  Widget progressBar(int totalExercises, int exerciseCompleted) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Workout Progress".toUpperCase(),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "$exerciseCompleted / $totalExercises Exercises",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),
          LinearProgressIndicator(
            minHeight: 5,
            borderRadius: BorderRadius.circular(20),
            value: exerciseCompleted / totalExercises,
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget currentExerciseContainer(
    String exerciseName,
    String muscleName,
    String imagePath,
    int totalSet,
    int reps,
  ) {
    return Padding(
      padding: EdgeInsetsGeometry.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentGeometry.bottomLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exerciseName,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Target Muscle: $muscleName",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[500],
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () => setState(() {
                imageClicked = !imageClicked;
              }),
              child: Container(
                height: MediaQuery.heightOf(context) * .23,
                width: MediaQuery.widthOf(context) * .9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(
                      imageClicked
                          ? 'assets/images/shoulder_press.gif'
                          : imagePath,
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
          Card(
            elevation: 0.1,
            color: Colors.grey[300],
            child: InkWell(
              onTap: () => {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Video Tutorial"),
                    content: Text(
                      "This is where the video tutorial will be displayed.",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Close"),
                      ),
                    ],
                  ),
                ),
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.play_circle,
                      color: const Color.fromARGB(255, 87, 176, 231),
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Watch Video Tutorial",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            spacing: 10,
            children: [
              currentSetRepContainer(
                "Current Set",
                ("$totalSet / $totalSet").toString(),
              ),
              currentSetRepContainer("Reps", ("$reps REPS").toString()),
            ],
          ),
        ],
      ),
    );
  }

  Widget buttonsForTheScreen() {
    return Column(
      children: [
        ElevatedButton.icon(
          style: ButtonStyle(
            elevation: WidgetStateProperty.all(2),
            shadowColor: WidgetStateProperty.all(Colors.black87),
            backgroundColor: WidgetStateProperty.all(Colors.black54),
            foregroundColor: WidgetStateProperty.all(Colors.white),
            padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(
                horizontal: MediaQuery.widthOf(context) * .30,
                vertical: 15,
              ),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          onPressed: () => (),
          icon: Icon(Icons.arrow_forward),
          iconAlignment: IconAlignment.end,
          label: Text(
            "Next Set".toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.grey[200]),
                foregroundColor: WidgetStateProperty.all(Colors.black38),
                padding: WidgetStateProperty.all(
                  EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () => (),
              label: Text("Skip Exercise"),
              icon: Icon(CupertinoIcons.play),
            ),
            TextButton.icon(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.grey[200]),
                foregroundColor: WidgetStateProperty.all(Colors.black38),
                padding: WidgetStateProperty.all(
                  EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () => setState(() {
                markCompleted = !markCompleted;
              }),
              label: Text("Mark Completed"),
              icon: Icon(
                markCompleted
                    ? CupertinoIcons.check_mark_circled_solid
                    : CupertinoIcons.check_mark_circled,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget currentSetRepContainer(String title, String bodyData) {
    return Container(
      height: MediaQuery.heightOf(context) * .10,
      width: MediaQuery.widthOf(context) * .42,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 5),
          Text(
            bodyData,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
