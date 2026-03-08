import 'dart:math';
import 'package:flutter/material.dart';

class CalorieCalculatorScreen extends StatefulWidget {
  const CalorieCalculatorScreen({super.key});

  @override
  State<CalorieCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<CalorieCalculatorScreen> {
  int? _selectedGender;
  String selectedActivityValue = 'Sedentary (little or no exercise)';
  String selectedGoalValue = 'Maintain weight';
  int bmrRate = 0;
  int maintainanceCalorie = 0;
  int targetCalories = 0;
  bool userClickedCalculate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calorie Calculator"), centerTitle: true),
      body: Column(
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
                                  Icons.calculate_outlined,
                                  size: 40,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Calorie calculator",
                              style: Theme.of(context).textTheme.headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Calculate your daily caloric needs based on your goals and activity level",
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
                      widgetContainer(customWidget: calculator()),
                      SizedBox(height: 20),
                      widgetContainer(customWidget: calorieResultsWidget()),
                      SizedBox(height: 20),
                      widgetContainer(
                        customWidget: understandingResultWidget(),
                      ),
                      SizedBox(height: 20),
                      widgetContainer(customWidget: macronutritionWidget()),
                      SizedBox(
                        height: MediaQuery.of(context).padding.bottom + 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget widgetContainer({required Widget customWidget}) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 30, left: 30, right: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color.fromARGB(255, 221, 219, 219), // border color
          width: 1, // border width
        ),
        borderRadius: BorderRadius.circular(12), // rounded corners
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [customWidget],
      ),
    );
  }

  Widget calculator() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Age (years)", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              hintText: "25",
              hintStyle: TextStyle(color: Colors.grey.shade600),
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              // isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text("Gender", style: TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: [
            Radio(
              value: 0,
              groupValue: _selectedGender,
              onChanged: (value) => setState(() => _selectedGender = value),
              activeColor: Colors.black,
            ),
            const Text("Male"),
            const SizedBox(width: 10), // Space between buttons
            Radio(
              value: 1,
              groupValue: _selectedGender,
              onChanged: (value) => setState(() => _selectedGender = value),
              activeColor: Colors.black,
            ),
            const Text("Female"),
          ],
        ),
        SizedBox(height: 10),
        Text("height (cm)", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              hintText: "170",
              hintStyle: TextStyle(color: Colors.grey.shade600),
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              // isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text("Weight (kg)", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              hintText: "70",
              hintStyle: TextStyle(color: Colors.grey.shade600),
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              // isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text("Activity Level", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        SizedBox(
          height: 40,

          child: DropdownMenu<String>(
            width: MediaQuery.widthOf(context) * .7,
            initialSelection: selectedActivityValue,
            menuHeight: 250,
            menuStyle: MenuStyle(
              padding: WidgetStateProperty.all(EdgeInsets.zero),
              backgroundColor: WidgetStateProperty.all(Colors.white),
              elevation: WidgetStateProperty.all(8), // Subtle shadow
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),

            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.grey.shade200,
              constraints: const BoxConstraints(maxHeight: 40),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ), // This creates the "text box" look
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 0,
              ),
            ),
            dropdownMenuEntries:
                [
                  'Sedentary (little or no exercise)',
                  'Lightly active (light exercise 1-3 days/week)',
                  'Moderately active (moderate exercise 3-5 days/week)',
                  'Very active (hard exercise 6-7 days/week)',
                  'Extra active (very hard exercise & physical job)',
                ].map((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
            onSelected: (String? value) {
              setState(() => selectedActivityValue = value!);
            },
          ),
        ),
        SizedBox(height: 10),
        Text("Goal", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        SizedBox(
          height: 40,
          child: DropdownMenu<String>(
            width: MediaQuery.widthOf(context) * .7,
            initialSelection: selectedGoalValue,
            menuHeight: 250,
            menuStyle: MenuStyle(
              padding: WidgetStateProperty.all(EdgeInsets.zero),
              backgroundColor: WidgetStateProperty.all(Colors.white),
              elevation: WidgetStateProperty.all(8), // Subtle shadow
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),

            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.grey.shade200,
              constraints: const BoxConstraints(maxHeight: 40),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ), // This creates the "text box" look
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 0,
              ),
            ),
            dropdownMenuEntries:
                [
                  'Lose weight (caloric deficit)',
                  'Maintain weight',
                  'Gain weight (caloric surplus)',
                ].map((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
            onSelected: (String? value) {
              setState(() => selectedGoalValue = value!);
            },
          ),
        ),
        SizedBox(height: 30),
        TextButton(
          onPressed: () => (setState(() {
            bmrRate = 1500 + Random().nextInt(2000 - 1500 + 1);
            maintainanceCalorie = 3200 + Random().nextInt(3500 - 3200 + 1);
            targetCalories = 2600 + Random().nextInt(3000 - 2600 + 1);
          })),
          style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text("Calculate Calories"),
        ),
      ],
    );
  }

  Widget calorieResultsWidget() {
    final List<Map<String, dynamic>> resultCards = [
      {
        "icon": Icons.trending_up_outlined,
        "title": "Base Metabolic Rate",
        "text": bmrRate.toString(),
        "bgColor": const Color(0xFFE8F7FF),
        "titleColor": Colors.blue,
        "borderColor": const Color(0xFFB3E5FC),
      },
      {
        "icon": Icons.local_fire_department_outlined,
        "title": "Maintenance Calories",
        "text": maintainanceCalorie.toString(),
        "bgColor": const Color(0xFFE8F5E9),
        "titleColor": Colors.green,
        "borderColor": const Color(0xFFC8E6C9),
      },
      {
        "icon": Icons.track_changes,
        "title": "Target Calories",
        "text": targetCalories.toString(),
        "bgColor": const Color(0xFFFFF3E0),
        "titleColor": Colors.orange,
        "borderColor": const Color(0xFFFFE0B2),
      },
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: 8,
          minLeadingWidth: 0,
          leading: Icon(Icons.local_fire_department, color: Colors.orange),
          title: Text(
            "Your Results",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        SizedBox(height: 30),
        ...resultCards.map(
          (e) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: e["bgColor"],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: e["borderColor"], width: 1),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(e["icon"], color: e["titleColor"]),
                      SizedBox(width: 6),
                      Text(
                        e["title"],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: e["titleColor"],
                        ),
                      ),
                    ],
                  ),
                  Text(e["text"], style: TextStyle(fontSize: 36, height: 1.1)),
                  Text(
                    "calories/day",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget understandingResultWidget() {
    late List<Map<String, dynamic>> informativeData = [
      {
        'title': "BMR (Basal Metabolic Rate)",
        'data':
            "The number of calories your body burns at rest to maintain vital functions like breathing, circulation, and cell production.",
      },
      {
        'title': "Maintenance Calories (TDEE)",
        'data':
            "Your Total Daily Energy Expenditure - the calories you burn per day including your activity level. Eating this amount maintains your current weight.",
      },
      {
        'title': "Target Calories",
        'data':
            "Same as your TDEE - eat this amount to maintain your current weight.",
      },
    ];
    late Map<String, String> disclaimer = {
      "label": "Pro Tip: ",
      "content":
          "These calculations are estimates. Monitor your progress and adjust your intake based on real results. Combine with regular exercise and a balanced diet for best results. Consider consulting a nutritionist for personalized advice.",
    };
    return Column(
      children: [
        Text(
          "Understanding Your Results",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 30),
        ...informativeData.map(
          (e) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.grey.withAlpha(30),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e['title'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          e['data'],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1, color: Colors.grey[400]!),
          ),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: disclaimer['label'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: disclaimer["content"],
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[900],
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget macronutritionWidget() {
    late List<Map<String, dynamic>> macronutrientDistribution = [
      {
        "title": "Proteins",
        "data":
            "${(targetCalories * 0.32 / 4).round()}g (${((targetCalories * 0.32 / 4).round() * 4)} cal)",
        "color": Colors.blue,
      },
      {
        "title": "Carbohydrates",
        "data":
            "${(targetCalories * 0.38 / 4).round()}g (${((targetCalories * 0.38 / 4).round() * 4)} cal)",
        "color": Colors.green,
      },
      {
        "title": "Fats",
        "data":
            "${(targetCalories * 0.3 / 9).round()}g (${((targetCalories * 0.3 / 9).round() * 9)} cal)",
        "color": Colors.orange,
      },
    ];
    return Column(
      children: [
        Text(
          "Macronutrient Breakdown",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 30),
        Text(
          "Recommended macronutrient distribution for your $targetCalories calorie target:",
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 30),
        ...macronutrientDistribution.map(
          (e) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      e["title"],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      e["data"],
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                    value:
                        double.parse(e["data"].split("(")[1].split(" ")[0]) /
                        targetCalories,
                    minHeight: 14,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: AlwaysStoppedAnimation(e["color"]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
