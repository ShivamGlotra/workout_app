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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calorie Calculator")),
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
                      Container(
                        padding: EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                          left: 40,
                          right: 40,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color.fromARGB(
                              255,
                              221,
                              219,
                              219,
                            ), // border color
                            width: 1, // border width
                          ),
                          borderRadius: BorderRadius.circular(
                            12,
                          ), // rounded corners
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [SizedBox(height: 10), calculator()],
                        ),
                      ),
                      SizedBox(height: 50),
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
          onPressed: () => (),
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
}
