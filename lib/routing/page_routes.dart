import 'package:flutter/material.dart';
import 'package:workout_app/constants/app_routes.dart';
import 'package:workout_app/screens/excerciseScreens/arms_page.dart';
import 'package:workout_app/screens/excerciseScreens/cardio_page.dart';
import 'package:workout_app/screens/excerciseScreens/core_page.dart';
import 'package:workout_app/screens/excerciseScreens/legs_page.dart';
import 'package:workout_app/screens/excerciseScreens/quick_workout_page.dart';
import 'package:workout_app/screens/excerciseScreens/shoulders_page.dart';
import '../screens/excerciseScreens/chest_page.dart';
import 'package:workout_app/screens/excerciseScreens/back_page.dart';

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
