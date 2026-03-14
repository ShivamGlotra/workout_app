import 'package:flutter/material.dart';
import 'package:workout_app/screens/about.dart';
import 'package:workout_app/screens/ai_bot_screen.dart';
import 'package:workout_app/screens/bmi_calculator.dart';
import 'package:workout_app/screens/calorie_calculator.dart';
import 'package:workout_app/screens/custom_workout.dart';
import 'package:workout_app/screens/exercise_library_screen.dart';
import 'package:workout_app/screens/profile_page.dart';
import 'package:workout_app/screens/weekly_exercise_plans.dart';
import 'package:workout_app/widgets/drawer.dart';
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
        '/excercisePlans': (context) => WeeklyExercisePlans(),
        '/bmi': (context) => BmiCalculatorScreen(),
        '/calorie': (context) => CalorieCalculatorScreen(),
        '/aiCoach': (context) => AiBotScreen(),
        '/about': (context) => About(),
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
    switch (route) {
      case 'Home':
        setState(() => _selectedIndex = 0);
        break;
      case 'Exercise Plans':
        Navigator.pushNamed(context, '/excercisePlans');
        break;
      case 'Workout Plans':
        setState(() => _selectedIndex = 2);
        break;
      case 'About':
        Navigator.pushNamed(context, '/about');
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Color(0xFF151521)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(Icons.home, 'Home', 0),
            _navItem(Icons.fitness_center, 'Exercises', 1),
            _navItem(Icons.event_note, 'My Workouts', 2),
            _navItem(Icons.person, 'Profile', 3),
          ],
        ),
      ),
    );
  }

  // Builder method
  Widget _navItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 3,
              width: isSelected ? _getTextWidth(label, context) : 0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: 10),
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey.shade500,
              size: 24,
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey.shade500,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget getPageHeadingText(PageHeading pageHeading) {
    return Text(pageHeading.value, style: const TextStyle());
  }

  double _getTextWidth(String label, BuildContext context) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: label,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.size.width;
  }
}
