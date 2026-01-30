import 'package:flutter/material.dart';
import 'package:workout_app/constants/app_routes.dart';
import 'package:workout_app/screens/arms_page.dart';
import 'package:workout_app/screens/cardio_page.dart';
import 'package:workout_app/screens/core_page.dart';
import 'package:workout_app/screens/home_page.dart';
import 'package:workout_app/screens/legs_page.dart';
import 'package:workout_app/screens/quick_workout_page.dart';
import 'package:workout_app/screens/shoulders_page.dart';
import '../screens/chest_page.dart';
import 'package:workout_app/screens/back_page.dart';

final Map<String, Widget> pageBuilders = {
  AppRoutes.home: const HomePage(),
  AppRoutes.chest: const ChestPage(),
  AppRoutes.back: const BackPage(),
  AppRoutes.shoulders: const ShouldersPage(),
  AppRoutes.legs: const LegPage(),
  AppRoutes.forearms: const ArmsPage(),
  AppRoutes.core: const CorePage(),
  AppRoutes.cardio: const CardioPage(),
  AppRoutes.quickGym: const QuickWorkoutPage(),
};
