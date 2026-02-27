import 'package:flutter/material.dart';

class NumberStepper extends StatefulWidget {
  final int? groupValue;

  const NumberStepper({super.key, required this.groupValue});

  @override
  State<NumberStepper> createState() => _NumberStepperState();
}

class _NumberStepperState extends State<NumberStepper> {
  int value = 0;
  final TextEditingController _stepperFieldController = TextEditingController();

  void increment() {
    setState(() {
      value++;
      _stepperFieldController.text = value.toString();
    });
  }

  void decrement() {
    if (value > 0) {
      setState(() {
        value--;
        _stepperFieldController.text = value.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _stepperFieldController,
              keyboardType: TextInputType.number,
              onChanged: (val) => value = int.tryParse(val) ?? 0,
              decoration: InputDecoration(
                hintText: widget.groupValue == 0 ? " 170" : " 67",
                hintStyle: TextStyle(color: Colors.grey.shade600),
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                // isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 5,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: increment,
                child: const Icon(Icons.keyboard_arrow_up, size: 20),
              ),
              InkWell(
                onTap: decrement,
                child: const Icon(Icons.keyboard_arrow_down, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
