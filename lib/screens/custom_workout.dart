import 'package:flutter/material.dart';

class CustomWorkoutScreen extends StatefulWidget {
  const CustomWorkoutScreen({super.key});

  @override
  State<CustomWorkoutScreen> createState() => _CustomWorkoutScreenState();
}

class _CustomWorkoutScreenState extends State<CustomWorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 360),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.list_alt,
                                size: 40,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Workout Plans",
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Create and manage your personalized workout routines.",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () => (
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Create New Plan"),
                            content: Text(
                              "New workout plan creation coming soon!",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text("Close"),
                              ),
                            ],
                          ),
                        ),
                      ),
                      icon: Icon(Icons.add, size: 20),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.black),
                        foregroundColor: WidgetStateProperty.all(Colors.white),
                        padding: WidgetStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        ),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      label: Text(
                        'Create New Plan',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    workoutCards(
                      "Beginner Full Body",
                      "Perfect starting point for fitness newcomers. Build foundational strength with simple"
                          "effective exercises.",
                      "Beginner",
                      const Color.fromARGB(255, 175, 247, 212),
                      const Color.fromARGB(255, 6, 107, 9),
                    ),
                    SizedBox(height: 15),
                    workoutCards(
                      "Strength Builder",
                      "Intermediate program focused on building raw strength with compound movements.",
                      "intermediate",
                      const Color.fromARGB(255, 248, 224, 191),
                      const Color.fromARGB(255, 179, 108, 2),
                    ),
                    SizedBox(height: 15),
                    workoutCards(
                      "Advance Athlete",
                      "High-intensity program for experienced lifters pushing their limits.",
                      "advanced",
                      const Color.fromARGB(255, 231, 185, 182),
                      const Color.fromARGB(255, 240, 22, 7),
                    ),
                    SizedBox(height: 15),
                    workoutCards(
                      "{Custom Workout}",
                      "Perfect starting point for fitness newcomers. Build foundational strength with simple"
                          "effective exercises.",
                      "{custom plan}",
                      const Color.fromARGB(255, 157, 203, 241),
                      const Color.fromARGB(255, 2, 30, 78),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget workoutCards(
    String title,
    String description,
    String tag,
    Color tagBackgroundColor,
    Color tagTextColor,
  ) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.black26, width: 1.2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.edit_note_outlined, size: 28),
                  color: Colors.black87,
                  padding: EdgeInsets.zero,
                  style: IconButton.styleFrom(
                    minimumSize: Size(30, 30), // Shrinks the touch target
                    padding: EdgeInsets.all(
                      10,
                    ), // Tightens the space around the icon
                    tapTargetSize: MaterialTapTargetSize
                        .shrinkWrap, // Tells Flutter to ignore the 48px rule
                  ),
                  onPressed: () => (showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Edit Workout"),
                      content: Text("Edit workout details here."),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text("Cancel"),
                        ),
                      ],
                    ),
                  )),
                ),
                IconButton(
                  icon: Icon(Icons.delete_forever_outlined, size: 25),
                  color: Colors.redAccent,
                  padding: EdgeInsets.zero,
                  style: IconButton.styleFrom(
                    minimumSize: Size(30, 30), // Shrinks the touch target
                    padding: EdgeInsets.all(
                      4,
                    ), // Tightens the space around the icon
                    tapTargetSize: MaterialTapTargetSize
                        .shrinkWrap, // Tells Flutter to ignore the 48px rule
                  ),
                  onPressed: () => (showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Delete Workout"),
                      content: Text(
                        "Are you sure you want to delete this workout?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            // Add delete logic here
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Delete",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
              ],
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                color: tagBackgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                tag,
                style: TextStyle(color: tagTextColor, fontSize: 11),
              ),
            ),
            SizedBox(height: 15),
            Text(
              description,
              style: TextStyle(color: Colors.black87, fontSize: 14),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20),
                Icon(Icons.watch_later_outlined, size: 20),
                SizedBox(width: 10),
                Text(
                  "4 weeks",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
                SizedBox(width: 70),
                Icon(Icons.watch_later_outlined, size: 20),
                SizedBox(width: 10),
                Text(
                  "3x per Week",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20),
                Icon(Icons.watch_later_outlined, size: 20),
                SizedBox(width: 10),
                Text(
                  "4 weeks",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
                SizedBox(width: 70),
                Icon(Icons.watch_later_outlined, size: 20),
                SizedBox(width: 10),
                Text(
                  "4 weeks",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 40),
            TextButton(
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(title),
                    content: Text(description),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.white),
                foregroundColor: WidgetStateProperty.all(Colors.black),
                padding: WidgetStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 108, vertical: 4),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Colors.black38),
                  ),
                ),
              ),
              child: Text(
                'View Details',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
