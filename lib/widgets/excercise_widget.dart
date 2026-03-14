import 'package:flutter/material.dart';
import 'package:workout_app/screens/exercise_details_screen.dart';

class ListItemData {
  final String title;
  final String image;
  final Color colorCode;

  const ListItemData({
    required this.title,
    required this.image,
    required this.colorCode,
  });
}

class ExcerciseWidget extends StatelessWidget {
  final List<ListItemData> data;

  const ExcerciseWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ExcerciseDetailsScreen(exerciseName: data[index].title),
                ),
              );
            },
            child: ListTile(
              leading: SizedBox(
                width: 40,
                height: 30,
                child: Image.asset(data[index].image),
              ),
              title: Text(data[index].title),
              trailing: Icon(Icons.circle, color: data[index].colorCode),
            ),
          ),
        );
      },
    );
  }
}
