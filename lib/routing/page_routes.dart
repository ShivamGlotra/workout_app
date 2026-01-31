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

final Map<String, Widget Function()> pageBuilders = {
  AppRoutes.chest: () => ChestPage(),
  AppRoutes.back: () => BackPage(),
  AppRoutes.shoulders: () => ShouldersPage(),
  AppRoutes.legs: () => LegPage(),
  AppRoutes.forearms: () => ArmsPage(),
  AppRoutes.core: () => CorePage(),
  AppRoutes.cardio: () => CardioPage(),
  AppRoutes.quickGym: () => QuickWorkoutPage(),
};
