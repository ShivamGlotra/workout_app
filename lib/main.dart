import 'package:flutter/material.dart';
import 'package:workout_app/screens/ai_bot_screen.dart';
import 'package:workout_app/screens/bmi_calculator.dart';
import 'package:workout_app/screens/calorie_calculator.dart';
import 'package:workout_app/screens/custom_workout.dart';
import 'package:workout_app/screens/excercise_library_screen.dart';
import 'package:workout_app/screens/profile_page.dart';
import 'package:workout_app/shared/widgets/drawer.dart';
import 'package:workout_app/screens/home_page.dart';
import 'constants/page_heading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GymCoach',
      theme: ThemeData(
        useMaterial3: true,
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(color: Colors.white),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      home: const MainNavigation(),
      routes: {
        '/bmi': (context) => BmiCalculatorScreen(),
        '/calorie': (context) => CalorieCalculatorScreen(),
        '/aiCoach': (context) => AiBotScreen(),
      },
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

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  void _onDrawerItemSelected(String route) {
    Navigator.pop(context); // close drawer
    print("Route Name $route");
    switch (route) {
      case 'Home':
        setState(() => _selectedIndex = 0);
        break;
      case 'Exercise Library':
        setState(() => _selectedIndex = 1);
        break;
      case 'Workout Plans':
        setState(() => _selectedIndex = 2);
        break;
      case 'Profile':
        setState(() => _selectedIndex = 3);
        break;
      case 'BMI Calculator':
        Navigator.pushNamed(context, '/bmi');
        break;
      case 'Calorie Calculator':
        Navigator.pushNamed(context, '/calorie');
        break;
      case 'AI Coach':
        Navigator.pushNamed(context, '/aiCoach');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool resetHome = _selectedIndex == 0;

    final List<Widget> screens = [
      HomePage(reset: resetHome), // "Home"
      ExcerciseLibraryScreen(), // "Excercises"
      CustomWorkoutScreen(),
      ProfilePage(),
    ];
    return Scaffold(
      drawer: CustomDrawer(onSelect: _onDrawerItemSelected),
      appBar: AppBar(
        title: getPageHeadingText(pageHeadings[_selectedIndex]),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, thickness: 0, color: Colors.black),
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Column(
          children: [
            // SizedBox(height: 10),
            // Search bar
            Expanded(
              child: IndexedStack(index: _selectedIndex, children: screens),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        height: 70,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
        },
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

  Widget getPageHeadingText(PageHeading pageHeading) {
    return Text(
      pageHeading.value,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
