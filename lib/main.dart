import 'package:flutter/material.dart';
import 'package:workout_app/screens/chest_page.dart';
import 'package:workout_app/shared/widgets/drawer.dart';
import 'package:workout_app/screens/home_page.dart';
import 'constants/pageHeading.dart';

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool resetHome = _selectedIndex == 0;

    final List<Widget> screens = [
      HomePage(reset: resetHome), // "Home"
      HomePage(reset: resetHome),
      HomePage(reset: resetHome),
      HomePage(reset: resetHome),
    ];
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: getPageHeadingText(pageHeadings[_selectedIndex]),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, thickness: 0, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .84,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search exercises",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.black26,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.black54, // <-- border color when active
                      width: 2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (query) {
                  print("Searching: $query");
                },
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: IndexedStack(index: _selectedIndex, children: screens),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        height: 70,
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
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
