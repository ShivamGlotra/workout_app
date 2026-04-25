import 'package:flutter/material.dart';
import 'package:workout_app/screens/exercise_details_screen.dart';

class ListItemData {
  final String image;
  final String title;
  final String subTitle;
  final Color colorCode;
  final String experienceLevel;
  final String muscleGroup;

  const ListItemData({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.colorCode,
    required this.experienceLevel,
    required this.muscleGroup,
  });
}

class ExerciseWidget extends StatelessWidget {
  final List<ListItemData> data;

  const ExerciseWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ExerciseDetailsScreen(exerciseName: data[index].title),
              ),
            );
          },
          // onLongPress: () => {
          //   showAboutDialog(
          //     context: context,
          //     children: [Text('Long pressed on ${data[index].title}')],
          //   ),
          // },
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.black.withAlpha(26)),
            ),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      data[index]
                          .image, // Replace with your shoe/exercise image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                data[index].title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1A233A),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () => {},
                              icon: Icon(Icons.bookmark_border),
                              color: Colors.blueGrey.shade200,
                              padding: EdgeInsets.zero,
                              visualDensity: VisualDensity.compact,
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.blueGrey.shade200,
                            ),
                          ],
                        ),
                        Text(
                          data[index].subTitle,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blueGrey,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            _buildTag(
                              data[index].muscleGroup.toUpperCase(),
                              Colors.blue.shade100,
                              Colors.blue,
                            ),
                            const SizedBox(width: 8),
                            _buildTag(
                              data[index].experienceLevel.toUpperCase(),
                              data[index].colorCode.withAlpha(26),
                              data[index].colorCode,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTag(String tag, Color tagBackgroundColor, Color tagTextColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: tagBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        tag,
        style: TextStyle(
          color: tagTextColor,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
