import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/screens/start_workout_flow/session_summary_screen.dart';
import 'package:workout_app/widgets/video_player.dart';

class CurrentExerciseScreen extends StatefulWidget {
  final List<String> exerciseList;
  final List<String>? customSetAndReps;
  final int userLevel;
  const CurrentExerciseScreen({
    required this.exerciseList,
    this.customSetAndReps,
    required this.userLevel,
    super.key,
  });

  @override
  State<CurrentExerciseScreen> createState() => _CurrentExerciseScreenState();
}

class _CurrentExerciseScreenState extends State<CurrentExerciseScreen> {
  Timer? _timer;
  int _seconds = 0;
  bool _isRunning = false;
  int exerciseListIndex = 0;
  bool markCompleted = false;
  bool imageClicked = false;
  int totalTime = 0;
  int currentSetIndex = 0;
  int get totalSets => widget.customSetAndReps != null
      ? int.parse(widget.customSetAndReps![0])
      : 0; // Default to 0 if customSetAndReps is null
  int get totalReps => widget.customSetAndReps != null
      ? int.parse(widget.customSetAndReps![1])
      : 0; // Default to 0 if customSetAndReps is null
  bool _isSkipButtonDisabled = false;
  final Set<String> completedExercises = {};

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _seconds++;
      });
    });
  }

  void _pauseTimer() {
    totalTime += _seconds;
    _timer?.cancel();
    setState(() => _isRunning = false);
  }

  void _stopTimer() {
    totalTime += _seconds;
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _seconds = 0;
    });
  }

  String _formatTimer(int totalSeconds) {
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  int getTotalSetsForLevel(int level) {
    switch (level) {
      case 0:
        return 3;
      case 1:
        return 4;
      case 2:
        return 5;
      default:
        return 4;
    }
  }

  int getTotalReps(int level) {
    switch (level) {
      case 0:
        return 8;
      case 1:
        return 10;
      case 2:
        return 12;
      default:
        return 8;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        titleSpacing: 0,
        leading: Icon(Icons.timer, color: Colors.blue),
        title: Text(_formatTimer(_seconds)),
        actions: [
          iconContainer(
            // _isRunning ? Icons.pause : Icons.play_arrow,
            // _isRunning ? Colors.grey : Colors.black54,
            // _isRunning ? _pauseTimer : _startTimer,
            _isRunning ? CupertinoIcons.pause : CupertinoIcons.play,
            _isRunning ? Colors.orange : Colors.green,
            _isRunning ? _pauseTimer : _startTimer,
          ),
          SizedBox(width: 10),
          iconContainer(Icons.stop, Colors.red, _stopTimer),
        ],
        bottom: PreferredSize(
          preferredSize: Size.zero,
          child: Divider(height: 1.1, thickness: 0.2),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 28),
            child: Column(
              spacing: 10,
              children: [
                progressBar(widget.exerciseList.length, exerciseListIndex + 1),
                widget.exerciseList.length > 1 &&
                        exerciseListIndex < widget.exerciseList.length - 1
                    ? Text(
                        "Up Next: ${widget.exerciseList[exerciseListIndex < widget.exerciseList.length - 1 ? exerciseListIndex + 1 : 0]}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      )
                    : SizedBox.shrink(),
                currentExerciseContainer(
                  widget.exerciseList[exerciseListIndex],
                  exerciseListIndex < widget.exerciseList.length - 1
                      ? widget.exerciseList[exerciseListIndex + 1]
                      : "",
                  "assets/images/incline_press.jpg",
                  currentSetIndex + 1,
                  totalSets != 0
                      ? totalSets
                      : getTotalSetsForLevel(widget.userLevel),
                  totalReps != 0 ? totalReps : getTotalReps(widget.userLevel),
                ),
                SizedBox(height: 20),
                buttonsForTheScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget iconContainer(
    IconData iconName,
    Color colorName,
    void Function()? onPressed,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: colorName.withAlpha(30),
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        highlightColor: Colors.transparent,
        visualDensity: VisualDensity.compact,
        icon: Icon(iconName),
        color: colorName,
        onPressed: onPressed,
      ),
    );
  }

  Widget progressBar(int totalExercises, int exerciseCompleted) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Workout Progress".toUpperCase(),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "$exerciseCompleted / $totalExercises Exercises",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),
          LinearProgressIndicator(
            minHeight: 5,
            borderRadius: BorderRadius.circular(20),
            value: exerciseCompleted / totalExercises,
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget currentExerciseContainer(
    String exerciseName,
    String muscleName,
    String imagePath,
    int currentSet,
    int totalSet,
    int reps,
  ) {
    return Padding(
      padding: EdgeInsetsGeometry.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentGeometry.bottomLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exerciseName,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  muscleName.isNotEmpty ? "Target Muscle: $muscleName" : "",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[500],
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () => setState(() {
                imageClicked = !imageClicked;
              }),
              child: Container(
                height: MediaQuery.heightOf(context) * .23,
                width: MediaQuery.widthOf(context) * .9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(
                      imageClicked
                          ? 'assets/images/shoulder_press.gif'
                          : imagePath,
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
          Card(
            elevation: 0.1,
            color: Colors.grey[300],
            child: InkWell(
              onTap: () => {
                showDialog(
                  context: context,
                  builder: (_) => CustomVideoPlayer(
                    videoUrl: "https://www.youtube.com/watch?v=2yjwXTZQDDI",
                  ),
                ),
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: MediaQuery.widthOf(context) * .20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.play_circle,
                      color: const Color.fromARGB(255, 87, 176, 231),
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Watch Video Tutorial",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.widthOf(context) * .035,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            spacing: 10,
            children: [
              currentSetRepContainer(
                "Current Set",
                currentSet.toString(),
                " / $totalSet",
              ),
              currentSetRepContainer("Reps", ("$reps").toString(), " REPS"),
            ],
          ),
        ],
      ),
    );
  }

  Widget buttonsForTheScreen() {
    return SizedBox(
      width: MediaQuery.widthOf(context) * .9,
      child: Column(
        children: [
          SizedBox(
            height: 55,
            width: MediaQuery.widthOf(context),
            child: ElevatedButton.icon(
              style: ButtonStyle(
                elevation: WidgetStateProperty.all(1),
                shadowColor: WidgetStateProperty.all(Colors.black87),
                backgroundColor: isLastSetOfLastExercise()
                    ? WidgetStateProperty.all(Colors.black)
                    : WidgetStateProperty.all(Colors.black54),
                foregroundColor: WidgetStateProperty.all(Colors.white),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () => {
                setState(() {
                  currentSetIndex <
                          (totalSets > 0
                              ? totalSets - 1
                              : getTotalSetsForLevel(widget.userLevel) - 1)
                      ? currentSetIndex++
                      : exerciseListIndex < widget.exerciseList.length - 1
                      ? incrementExerciseAndSet()
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SessionSummaryScreen(
                              completedExercises: completedExercises.toList(),
                              workoutTime: totalTime,
                            ),
                          ),
                        );
                }),
              },
              icon: Icon(Icons.arrow_forward),
              iconAlignment: IconAlignment.end,
              label: Text(
                getButtonName(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.widthOf(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 55,
                  width: MediaQuery.widthOf(context) * .44,
                  child: TextButton.icon(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Colors.grey[200],
                      ),
                      foregroundColor: WidgetStateProperty.resolveWith<Color>((
                        states,
                      ) {
                        if (_isSkipButtonDisabled) {
                          return Colors.grey; // disabled color
                        }
                        return Colors.blue; // enabled color
                      }),
                      overlayColor: _isSkipButtonDisabled
                          ? WidgetStateProperty.all(Colors.transparent)
                          : null,
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () => _isSkipButtonDisabled
                        ? null
                        : () {
                            if (exerciseListIndex <
                                widget.exerciseList.length - 1) {
                              exerciseListIndex++;
                              currentSetIndex = 0;
                            } else {
                              currentSetIndex = totalSets > 0
                                  ? totalSets - 1
                                  : getTotalSetsForLevel(widget.userLevel) - 1;
                              setState(() {
                                _stopTimer();
                                _isSkipButtonDisabled = true;
                              });
                            }
                          }(),
                    label: Text("Skip Exercise"),
                    icon: Icon(CupertinoIcons.play),
                  ),
                ),
                SizedBox(
                  height: 55,
                  width: MediaQuery.widthOf(context) * .44,
                  child: TextButton.icon(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Colors.grey[200],
                      ),
                      foregroundColor: WidgetStateProperty.resolveWith<Color>((
                        states,
                      ) {
                        if (_isSkipButtonDisabled) {
                          return Colors.grey; // disabled color
                        }
                        return Colors.blue; // enabled color
                      }),
                      overlayColor: _isSkipButtonDisabled
                          ? WidgetStateProperty.all(Colors.transparent)
                          : null,
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () => _isSkipButtonDisabled
                        ? null
                        : () {
                            setState(() {
                              markCompleted = !markCompleted;
                              completedExercises.add(
                                widget.exerciseList[exerciseListIndex],
                              );
                              // Turn the tick mark back to outline after .3 secs
                              Future.delayed(Duration(milliseconds: 300), () {
                                setState(() {
                                  markCompleted = !markCompleted;
                                });
                              });
                            });
                            if (exerciseListIndex <
                                widget.exerciseList.length - 1) {
                              exerciseListIndex++;
                              currentSetIndex = 0;
                            } else {
                              currentSetIndex = totalSets > 0
                                  ? totalSets - 1
                                  : getTotalSetsForLevel(widget.userLevel) - 1;
                              setState(() {
                                _stopTimer();
                                _isSkipButtonDisabled = true;
                              });
                            }
                          }(),
                    label: Text("Mark Completed"),
                    icon: Icon(
                      markCompleted
                          ? CupertinoIcons.check_mark_circled_solid
                          : CupertinoIcons.check_mark_circled,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 60,
            width: MediaQuery.widthOf(context),
            child: Card(
              elevation: 1,
              color: Colors.red[50],
              child: TextButton(
                child: Text(
                  "End Workout",
                  style: TextStyle(
                    color: Colors.red[400],
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () => {
                  setState(() => _stopTimer()),
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SessionSummaryScreen(
                        completedExercises: completedExercises.toList(),
                        workoutTime: totalTime,
                      ),
                    ),
                  ),
                },
              ),
            ),
          ),
          TextButton.icon(
            style: ButtonStyle(
              shadowColor: WidgetStateProperty.all(Colors.transparent),
              foregroundColor: WidgetStateProperty.all(Colors.black54),
              padding: WidgetStateProperty.all(
                EdgeInsets.only(top: 10, right: 10),
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            onPressed: () => setState(() {
              Navigator.of(context).popUntil((route) => route.isFirst);
            }),
            label: Text("Return to Home"),
            icon: Icon(CupertinoIcons.home),
          ),
        ],
      ),
    );
  }

  Widget currentSetRepContainer(
    String title,
    String currentData, // current set and REPS
    String leadingData, // total set and REPS
  ) {
    return Container(
      height: MediaQuery.heightOf(context) * .15,
      width: MediaQuery.widthOf(context) * .42,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 5),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: currentData,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                TextSpan(
                  text: leadingData,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getButtonName() {
    if (isLastSetOfLastExercise()) {
      setState(() {
        _isSkipButtonDisabled = true;
        _stopTimer();
      });
      return "Finish Workout".toUpperCase();
    } else {
      return currentSetIndex <
              (totalSets > 0
                  ? totalSets - 1
                  : getTotalSetsForLevel(widget.userLevel) - 1)
          ? "Next Set".toUpperCase()
          : "Next Exercise".toUpperCase();
    }
  }

  void incrementExerciseAndSet() {
    exerciseListIndex++;
    currentSetIndex = 0;
    completedExercises.add(widget.exerciseList[exerciseListIndex]);
  }

  bool isLastSetOfLastExercise() {
    return exerciseListIndex == widget.exerciseList.length - 1 &&
        currentSetIndex ==
            (totalSets > 0
                ? totalSets - 1
                : getTotalSetsForLevel(widget.userLevel) - 1);
  }
}
