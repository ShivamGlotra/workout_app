// import 'package:flutter/material.dart';
// import 'package:workout_app/constants/exercises.dart';
// import 'package:workout_app/widgets/exercise_widget.dart';
// import 'package:workout_app/widgets/gradient_title.dart';

// class ExerciseFilterData extends StatelessWidget {
//   final List<ListItemData> filteredExercises;
//   final List<String> allFilters;
//   const ExerciseFilterData({super.key, required this.filteredExercises});

//   Map<String, List<ListItemData>> getFilteredData(
//     List<ListItemData> filteredExercises,
//   ) {
//     final excerciseListByExperienceLevel = <String, List<ListItemData>>{};
//     for (var exercise in filteredExercises) {
//       excerciseListByExperienceLevel
//           .putIfAbsent(exercise.experienceLevel, () => [])
//           .add(exercise);
//     }
//     return excerciseListByExperienceLevel;
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final excerciseListByExperienceLevel = <String, List<ListItemData>>{};
//     final excerciseListByExperienceLevel = getFilteredData(filteredExercises);
//     return Column(
//       children: excerciseListByExperienceLevel.entries.map((entry) {
//         final experienceLevel = entry.key;
//         final exercises = entry.value;
//         return Padding(
//           padding: EdgeInsets.only(bottom: 40),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 5),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GradientTitle(
//                       containerColorName: allFilters,
//                       muscleName: experienceLevel,
//                     ),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 12,
//                         vertical: 6,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.grey.shade200,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Text(
//                         "${exercises.length} exercises",
//                         style: TextStyle(
//                           color: Colors.grey.shade600,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 13,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 12),
//               ExerciseWidget(data: exercises),
//             ],
//           ),
//         );
//       }).toList(),
//     );
//   }
// }
