import 'package:flutter/material.dart';
import 'package:workout_app/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LetsWorkout',
      theme: ThemeData(
        useMaterial3: true,
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(color: Colors.white),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = <Widget>[
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: NavigationBar(
        height: 70,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) =>
            setState(() => _selectedIndex = index),
        backgroundColor: Colors.black,
        indicatorColor: Colors.white60,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home, color: Colors.white),
            selectedIcon: Icon(Icons.home, color: Colors.black),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.fitness_center, color: Colors.white),
            selectedIcon: Icon(Icons.fitness_center, color: Colors.black),
            label: "Excercises",
          ),
          NavigationDestination(
            icon: Icon(Icons.event_note, color: Colors.white),
            selectedIcon: Icon(Icons.event_note, color: Colors.black),
            label: "My Workouts",
          ),
          NavigationDestination(
            icon: Icon(Icons.person, color: Colors.white),
            selectedIcon: Icon(Icons.person, color: Colors.black),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
