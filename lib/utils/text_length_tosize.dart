import 'package:flutter/material.dart';

double getTextWidth(
  String label, {
  double fontSize = 12,
  FontWeight fontWeight = FontWeight.w600,
}) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(
      text: label,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
    ),
    maxLines: 1,
    textDirection: TextDirection.ltr,
  )..layout();
  return textPainter.size.width;
}
