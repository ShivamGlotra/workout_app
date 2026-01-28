import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> exerciseTiles = [
    {"title": "CHEST", "image": "assets/images/chest.png"},
    {"title": "BACK", "image": "assets/images/back.png"},
    {"title": "SHOULDERS", "image": "assets/images/shoulder.png"},
    {"title": "LEGS", "image": "assets/images/legs.png"},
    {"title": "ARMS", "image": "assets/images/biceps.png"},
    {"title": "CORE", "image": "assets/images/core.png"},
    {"title": "CARDIO", "image": "assets/images/cardio.png"},
    {"title": "30 Min WORKOUT", "image": "assets/images/triceps.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...List.generate((exerciseTiles.length / 2).ceil(), (rowIndex) {
              int firstIndex = rowIndex * 2;
              int secondIndex = firstIndex + 1;
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    exerciseTile(context, exerciseTiles[firstIndex]),
                    if (secondIndex < exerciseTiles.length)
                      const SizedBox(width: 20),
                    if (secondIndex < exerciseTiles.length)
                      exerciseTile(context, exerciseTiles[secondIndex]),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget exerciseTile(BuildContext context, Map<String, dynamic> data) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Set tile size as fraction of screen
    final tileHeight = screenHeight * 0.15; // adjust as needed
    final tileWidth = (screenWidth - 88) / 2; // 16px padding + 20px spacing

    return SizedBox(
      height: tileHeight,
      width: tileWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(data['image'], fit: BoxFit.cover),
            Material(
              color: Colors.black26, // semi-transparent overlay
              child: InkWell(
                onTap: () {
                  // handle button tap
                },
                child: Center(
                  child: Text(
                    data['title'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 204, 243, 247),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
