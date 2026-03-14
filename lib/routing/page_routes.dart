import 'package:flutter/material.dart';
import 'package:workout_app/constants/app_routes.dart';
import 'package:workout_app/screens/exerciseScreens/arms_page.dart';
import 'package:workout_app/screens/exerciseScreens/cardio_page.dart';
import 'package:workout_app/screens/exerciseScreens/core_page.dart';
import 'package:workout_app/screens/exerciseScreens/legs_page.dart';
import 'package:workout_app/screens/exerciseScreens/quick_workout_page.dart';
import 'package:workout_app/screens/exerciseScreens/shoulders_page.dart';
import '../screens/exerciseScreens/chest_page.dart';
import 'package:workout_app/screens/exerciseScreens/back_page.dart';

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
