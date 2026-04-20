import 'package:flutter/material.dart';

class ExerciseHeaderSection extends StatelessWidget {
  final List<String> heading;

  const ExerciseHeaderSection({required this.heading, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              children: [
                TextSpan(
                  text: heading.first,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const TextSpan(text: '\n'),
                TextSpan(
                  text: heading[1],
                  style: TextStyle(
                    color: Colors.blue.shade600,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontFamily: 'italic',
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),
          Text(
            heading[2],
            style: TextStyle(
              color: Colors.grey.shade800,
              fontSize: 16,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
