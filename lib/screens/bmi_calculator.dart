import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/widgets/number_stepper.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  int? _groupValue = 0;
  int height = 0;
  int weight = 0;
  bool isMetric = false;
  bool isImperial = false;
  double bmiResult = 0;
  bool userClickedCalculate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator"), centerTitle: true),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 360),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
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
                                    Icons.scale,
                                    size: 40,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "BMI calculator",
                                style: Theme.of(context).textTheme.headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Calculate your Body Mass Index to assess your body weight category",
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
                        widgetContainer(
                          customWidget: calculator(),
                          showSegmentControl: true,
                        ),
                        SizedBox(height: userClickedCalculate ? 20 : 30),
                        if (userClickedCalculate) ...[
                          widgetContainer(
                            customWidget: bmiResultWidget(
                              _groupValue,
                              height,
                              weight,
                            ),
                          ),
                          SizedBox(height: 20),
                          widgetContainer(customWidget: bmiCategoryBlock()),
                          SizedBox(height: 30),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget widgetContainer({
    required Widget customWidget,
    bool showSegmentControl = false,
  }) {
    return Container(
      padding: EdgeInsets.only(
        top: showSegmentControl ? 20 : 0,
        bottom: 20,
        left: 40,
        right: 40,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color.fromARGB(255, 221, 219, 219), // border color
          width: 1, // border width
        ),
        borderRadius: BorderRadius.circular(12), // rounded corners
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          showSegmentControl
              ? CupertinoSlidingSegmentedControl<int>(
                  backgroundColor:
                      Colors.grey.shade200, // Background pill color
                  thumbColor: Colors.white, // The "active" button color
                  groupValue: _groupValue,
                  children: {
                    0: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Metric (Kg,cm)",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    1: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Imperial (lbs,in)",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  },
                  onValueChanged: (value) {
                    setState(() => _groupValue = value);
                  },
                )
              : Container(),
          SizedBox(height: 20),
          customWidget,
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget calculator() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Height${_groupValue == 0 ? " (cm)" : " (inches)"}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        NumberStepper(
          groupValue: _groupValue,
          metricValue: 0, // 165
          imperialValue: 0, // 65
          onChanged: (value) => setState(() {
            _groupValue == 0 ? isMetric = true : isImperial = true;
            height = value;
          }),
        ),
        SizedBox(height: 10),
        Text(
          "Weight${_groupValue == 0 ? " (kg)" : " (lbs)"}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        NumberStepper(
          groupValue: _groupValue,
          metricValue: 0, // 70
          imperialValue: 0, // 154
          onChanged: (value) => setState(() {
            weight = value;
          }),
        ),
        SizedBox(height: 15),
        TextButton(
          onPressed: () {
            if (height == 0 || weight == 0) {
              userClickedCalculate = false;
              _showErrorDialog(context);
              setState(() {
                bmiResult = 0;
              });
            }
            // 1. Convert height from cm to meters if necessary
            double heightInMeters = height / 100;

            // 2. Calculate BMI
            double bmiValue = weight / (heightInMeters * heightInMeters);

            // 3. Update the UI
            setState(() {
              // Check if the result is a valid number, otherwise default to 0.0
              if (bmiValue.isFinite && !bmiValue.isNaN) {
                bmiResult = (bmiValue * 100).roundToDouble() / 100;
                userClickedCalculate = true;
              } else {
                bmiResult = 0.0;
              }
            });
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text("Calculate BMI"),
        ),
      ],
    );
  }

  Widget bmiResultWidget(int? groupValue, int height, int weight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Your BMI"),
        SizedBox(height: 5),
        Text(
          bmiResult.toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
        ),
        SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: getBmiColor(
              getBmiCategory(bmiResult),
            ).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: getBmiColor(getBmiCategory(bmiResult)),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                getBmiCategory(bmiResult),
                style: TextStyle(
                  color: getBmiColor(getBmiCategory(bmiResult)),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        customMeter(value: bmiResult, max: 40),
        SizedBox(height: 15),
        bmiInformationBlock(
          '{"question": "What does this mean?", "answer": "You are in the obese category. We recommend consulting with a healthcare provider to develop a comprehensive weight management plan."}',
        ),
      ],
    );
  }

  Widget customMeter({
    required double value, // current bmi value
    required double max, // max possible value
  }) {
    final progress = (value / max).clamp(0.0, 1.0);
    final List<String> bmiWeightType = [
      " Underweight",
      "    Normal",
      "    Overweight",
      "          Obese",
    ];
    final List<String> bmiNumbers = ["15", "18.5", "25", "30", "40"];

    return Column(
      children: [
        Row(
          children: bmiWeightType
              .map(
                (type) => Expanded(
                  child: Center(
                    child: Text(
                      type,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 14,
            backgroundColor: Colors.grey.shade300,
            valueColor: const AlwaysStoppedAnimation(Colors.black),
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: bmiNumbers
              .map(
                (type) => Expanded(
                  child: Center(
                    child: Text(
                      type,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget bmiInformationBlock(String jsonString) {
    Map<String, dynamic> data = jsonDecode(jsonString);

    String question = data['question'] ?? "N/A";
    String answer = data['answer'] ?? "N/A";

    return Container(
      width: double.infinity,
      height: MediaQuery.heightOf(context) * .2,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(30),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  answer,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bmiCategoryBlock() {
    final List<Map<String, dynamic>> bmiCategories = [
      {
        "category": "Underweight",
        "scale": "< 18.5",
        "color": 0xFF42A5F5, // Vibrant Blue
      },
      {
        "category": "Normal Weight",
        "scale": "18.5 - 24.9",
        "color": 0xFF66BB6A, // Soft Green
      },
      {
        "category": "Overweight",
        "scale": "25.0 - 29.9",
        "color": 0xFFFFCA28, // Darker/Amber Yellow
      },
      {
        "category": "Obesity",
        "scale": "≥ 30.0",
        "color": 0xFFEF5350, // Soft Red
      },
    ];

    const disclaimer = {
      "label": "Note: ",
      "content":
          "BMI is a screening tool and doesn't directly measure body fat. Factors like muscle mass, bone density, and overall body composition aren't considered. Consult with healthcare professionals for a comprehensive health assessment.",
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ListTile(
          leading: Icon(Icons.trending_up),
          title: Text(
            "BMI Categories",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        SizedBox(height: 15),
        ...bmiCategories.map(
          (e) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              children: [
                Icon(Icons.circle, color: Color(e["color"]), size: 12),
                SizedBox(width: 8),
                Text(e['category']),
                Spacer(),
                Text(e['scale']),
              ],
            ),
          ),
        ),
        SizedBox(height: 25),
        Container(
          width: double.infinity,
          height: MediaQuery.heightOf(context) * .2,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.grey.withAlpha(30),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: disclaimer['label'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                TextSpan(
                  text: disclaimer["content"],
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
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

  String getBmiCategory(double bmiResult) {
    if (bmiResult < 18.5) {
      return "Underweight";
    } else if (bmiResult >= 18.5 && bmiResult < 24.9) {
      return "Normal Weight";
    } else if (bmiResult >= 25.0 && bmiResult < 30.0) {
      return "Overweight";
    } else {
      return "Obesity";
    }
  }

  Color getBmiColor(String getBmiCategory) {
    switch (getBmiCategory) {
      case "Underweight":
        return Color(0xFF42A5F5); // Vibrant Blue
      case "Normal Weight":
        return Color(0xFF66BB6A); // Soft Green
      case "Overweight":
        return Color(0xFFFFCA28); // Darker/Amber Yellow
      case "Obesity":
        return Color(0xFFEF5350); // Soft Red
      default:
        return Colors.grey; // Default color for unknown categories
    }
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Empty Value!!!"),
          content: Text("Please enter height and weight."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK", style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }
}
