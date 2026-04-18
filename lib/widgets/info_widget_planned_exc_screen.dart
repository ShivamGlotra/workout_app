import 'package:flutter/material.dart';

class InformationWidgetPlannedExcScreen extends StatelessWidget {
  InformationWidgetPlannedExcScreen({super.key});

  // move this data structure to the parent (stateful) if needs to be changed with state (no reload)
  final List<Map<String, dynamic>> informationData = [
    {
      "icon": Icons.emoji_events_outlined,
      "title": "BEGINNER",
      "description":
          "Focus on form and building a foundation. Learn fundamental movement patterns with controlled volume.",
    },
    {
      "icon": Icons.emoji_events,
      "title": "INTERMEDIATE",
      "description":
          "Increase training intensity and volume. Incorporate more complex exercises and variations to challenge your muscles.",
    },
    {
      "icon": Icons.military_tech,
      "title": "ADVANCED",
      "description":
          "High volume and maximal effort. Designed for experienced lifters seeking to push their limits with advanced techniques and heavy loads.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Colors.black.withAlpha(200), width: 6),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.info, color: Colors.black87),
                ),
                SizedBox(height: 10),
                Text(
                  'TRAINING LEVELS',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                ...informationData.map(
                  (data) => textContainers(
                    context,
                    data['icon'],
                    data['title'],
                    data['description'],
                  ),
                ),
                SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    style: ButtonStyle(
                      elevation: WidgetStateProperty.all(2),
                      shadowColor: WidgetStateProperty.all(Colors.black87),
                      backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(221, 43, 43, 43),
                      ),
                      foregroundColor: WidgetStateProperty.all(Colors.white),

                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    label: Text(
                      'Got it, thanks!',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textContainers(
    BuildContext context,
    IconData icon,
    String title,
    String description,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 30, color: Colors.black87),
        SizedBox(width: 20),
        SizedBox(
          width: MediaQuery.widthOf(context) * .5,
          height: MediaQuery.heightOf(context) * .18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 3,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Expanded(
                child: Text(
                  description,
                  style: TextStyle(height: 1.3, letterSpacing: 1, fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
