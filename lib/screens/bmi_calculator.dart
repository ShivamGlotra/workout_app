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
                  borderRadius: BorderRadius.circular(12), // rounded corners
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CupertinoSlidingSegmentedControl<int>(
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
                    ),
                    SizedBox(height: 20),
                    calculator(),
                  ],
                ),
              ),
            ],
          ),
        ),
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
        NumberStepper(groupValue: _groupValue),
        SizedBox(height: 10),
        Text(
          "Weight${_groupValue == 0 ? " (kg)" : " (lbs)"}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              hintText: _groupValue == 0 ? " 70" : " 154",
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
        SizedBox(height: 15),
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
          child: Text("Calculate BMI"),
        ),
      ],
    );
  }
}
