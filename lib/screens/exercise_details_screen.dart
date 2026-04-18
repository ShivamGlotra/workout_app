import 'package:flutter/material.dart';
import 'package:workout_app/widgets/video_player.dart';

class ExerciseDetailsScreen extends StatefulWidget {
  final String exerciseName;
  const ExerciseDetailsScreen({super.key, required this.exerciseName});

  @override
  State<ExerciseDetailsScreen> createState() => _ExerciseDetailsScreenState();
}

class _ExerciseDetailsScreenState extends State<ExerciseDetailsScreen> {
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
                      onPressed: () => (),
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
}
