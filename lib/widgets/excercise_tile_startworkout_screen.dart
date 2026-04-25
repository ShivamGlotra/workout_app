// ── Extracted stateless tile widget ────────────────────────────────────────
import 'package:flutter/material.dart';

class ExerciseTile extends StatelessWidget {
  final Map<String, dynamic> data;
  final double width;
  final double height;
  final bool isSelected;
  final VoidCallback onTap;

  const ExerciseTile({
    required this.data,
    required this.width,
    required this.height,
    required this.isSelected,
    required this.onTap,
     super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Scale icon circle & font relative to card size
    final double circleSize = (width * 0.22).clamp(32.0, 56.0);
    final double iconSize   = (width * 0.12).clamp(18.0, 30.0);
    final double fontSize   = (width * 0.08).clamp(11.0, 16.0);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(
          vertical: height * 0.15,
          horizontal: width * 0.1,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue[50] : Colors.white,
          borderRadius: BorderRadius.circular((width * 0.07).clamp(8.0, 16.0)),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.withAlpha(60),
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: circleSize,
              height: circleSize,
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.blue.shade300
                    : Colors.grey.withAlpha(60),
                shape: BoxShape.circle,
              ),
              child: Icon(
                data['icon'] as IconData,
                size: iconSize,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
            SizedBox(height: height * 0.08),
            Text(
              data['title'].toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}