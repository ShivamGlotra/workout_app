import 'package:flutter/material.dart';

class NumberStepper extends StatefulWidget {
  final int? groupValue;
  final int metricValue;
  final int imperialValue;
  final ValueChanged<int> onChanged;

  const NumberStepper({
    super.key,
    required this.groupValue,
    this.metricValue = 0,
    this.imperialValue = 0,
    required this.onChanged,
  });

  @override
  State<NumberStepper> createState() => _NumberStepperState();
}

class _NumberStepperState extends State<NumberStepper> {
  int value = 0;
  late TextEditingController _stepperFieldController;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    widget.groupValue == 0
        ? value = widget.metricValue
        : value = widget.imperialValue;
    _stepperFieldController = TextEditingController(text: value.toString());
    focusNode = FocusNode();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        _stepperFieldController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: _stepperFieldController.text.length,
        );
      }
    });
  }

  @override
  void dispose() {
    _stepperFieldController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void increment() {
    setState(() {
      value++;
      _stepperFieldController.text = value.toString();
    });
    widget.onChanged(value);
  }

  void decrement() {
    if (value > 0) {
      setState(() {
        value--;
        _stepperFieldController.text = value.toString();
      });
    }
    widget.onChanged(value);
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
              focusNode: focusNode,
              keyboardType: TextInputType.number,
              onChanged: (val) {
                value = int.tryParse(val) ?? 0;
                widget.onChanged(value);
              },
              decoration: InputDecoration(
                hintText: widget.groupValue == 0
                    ? widget.metricValue.toString()
                    : widget.imperialValue.toString(),
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
