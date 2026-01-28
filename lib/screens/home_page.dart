import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> drawerButtons = [
    {"title": "Home", "icon": Icons.home},
    {"title": "Exercise Library", "icon": Icons.fitness_center},
    {"title": "Workout Plans", "icon": Icons.event_note},
    {"title": "BMI Calculator", "icon": Icons.calculate},
    {"title": "Calorie Calculator", "icon": Icons.restaurant},
    {"title": "AI Coach", "icon": Icons.smart_toy},
    {"title": "Profile", "icon": Icons.person},
  ];

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

  int _selectedIndex = 0;
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Let's Workout"),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, thickness: 0, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: SearchBar(
                  hintText: 'Search exercises',
                  leading: const Icon(Icons.search),
                  elevation: MaterialStateProperty.all(1),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
            ),
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
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 80,
              child: Center(
                child: Text(
                  "Let's Workout",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Divider(
              height: 1,
              thickness: 2,
              color: Colors.black45,
              // indent: 10, // Empty space to the left of the line
              // endIndent: 10, // Empty space to the right of the line
            ),
            const SizedBox(height: 10),
            Column(
              children: drawerButtons.asMap().entries.map((entry) {
                var data = entry.value;
                int index = entry.key;
                return drawerButton(
                  data['icon'],
                  data['title'],
                  _selectedIndex == index,
                  () => _onItemTap(index),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget drawerButton(
    IconData icon,
    String title,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Material(
        color: isSelected ? Colors.black : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          child: ListTile(
            leading: Icon(
              icon,
              color: isSelected ? Colors.white : Colors.black,
            ),
            title: Text(
              title,
              style: TextStyle(color: isSelected ? Colors.white : Colors.black),
            ),
            onTap: onTap,
          ),
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
