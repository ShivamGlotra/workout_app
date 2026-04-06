import 'dart:async';
import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  const Timer({super.key});

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  Timer? _timer;
  int _seconds = 0;
  bool _isRunning = false;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
