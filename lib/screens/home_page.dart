import 'package:flutter/material.dart';
import 'package:workout_app/routing/page_routes.dart';

class HomePage extends StatefulWidget {
  final bool reset;
  const HomePage({super.key, required this.reset});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _activePageKey;

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
  void didUpdateWidget(covariant HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.reset && _activePageKey != null) {
      setState(() {
        _activePageKey = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .84,
            height: MediaQuery.of(context).size.width * .05,
            // child: TextField(
            //   decoration: InputDecoration(
            //     hintText: "Search exercises",
            //     prefixIcon: const Icon(Icons.search),
            //     filled: true,
            //     fillColor: MaterialStateColor.resolveWith((
            //       Set<MaterialState> states,
            //     ) {
            //       if (states.contains(MaterialState.focused)) {
            //         return Colors.white; // Color when focused
            //       }
            //       return const Color.fromARGB(
            //         255,
            //         233,
            //         233,
            //         233,
            //       ); // Color when NOT focused
            //     }),
            //     // enabledBorder: OutlineInputBorder(
            //     //   borderRadius: BorderRadius.circular(12),
            //     //   borderSide: const BorderSide(
            //     //     color: Colors.black26,
            //     //     width: 2,
            //     //   ),
            //     // ),
            //     focusedBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(12),
            //       borderSide: const BorderSide(
            //         color: Colors.black38, // <-- border color when active
            //         width: 2,
            //       ),
            //     ),
            //     contentPadding: const EdgeInsets.symmetric(vertical: 0),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(12),
            //       borderSide: BorderSide(color: Colors.grey.shade300),
            //     ),
            //   ),
            //   onChanged: (query) {},
            // ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child:
                _activePageKey != null &&
                    pageBuilders.containsKey(_activePageKey)
                ? pageBuilders[_activePageKey]!()
                : buildExerciseGrid(context),
          ),
        ),
      ],
    );
  }

  Widget exerciseTile(BuildContext context, Map<String, dynamic> data) {
    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;

    // // Set tile size as fraction of screen
    // final tileHeight = screenHeight * 0.14; // adjust as needed
    // final tileWidth = (screenWidth - 82) / 2; // 16px padding + 20px spacing

    return AspectRatio(
      aspectRatio: 1.3,
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
                  setState(() {
                    _activePageKey = data['title'];
                  });
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

  Widget buildExerciseGrid(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        ...List.generate((exerciseTiles.length / 2).ceil(), (rowIndex) {
          int firstIndex = rowIndex * 2;
          int secondIndex = firstIndex + 1;
          return Padding(
            padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: exerciseTile(context, exerciseTiles[firstIndex]),
                ),
                if (secondIndex < exerciseTiles.length)
                  const SizedBox(width: 15),
                if (secondIndex < exerciseTiles.length)
                  Expanded(
                    child: exerciseTile(context, exerciseTiles[secondIndex]),
                  ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
