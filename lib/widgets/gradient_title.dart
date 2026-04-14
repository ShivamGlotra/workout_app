import 'package:flutter/material.dart';

class GradientTitle extends StatelessWidget {
  final Color? containerColorName;
  final String? muscleName;

  const GradientTitle({
    required this.containerColorName,
    required this.muscleName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 30,
                  width: 4,
                  decoration: BoxDecoration(
                    color: containerColorName ?? Colors.blue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Container(
                  width: MediaQuery.widthOf(context) * .5,
                  height: 30,
                  padding: const EdgeInsets.only(left: 8, bottom: 2, top: 2),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        containerColorName?.withOpacity(0.1) ??
                            Colors.blue.withOpacity(0.1),
                        Colors.transparent,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Text(
                    (muscleName ?? 'Exercise List').toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.4,
                      color: Color(0xFF1a2340),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
