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
      appBar: AppBar(title: const Text("Let's Workout"), centerTitle: true),

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
}
