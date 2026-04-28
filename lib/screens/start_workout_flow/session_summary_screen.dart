import 'package:flutter/material.dart';
import 'dart:math' as math;

class SessionSummaryScreen extends StatefulWidget {
  final List<String> completedExercises;
  final int workoutTime;

  const SessionSummaryScreen({
    required this.completedExercises,
    required this.workoutTime,
    super.key,
  });

  @override
  State<SessionSummaryScreen> createState() => _SessionSummaryScreenState();
}

class _SessionSummaryScreenState extends State<SessionSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    final totalExercises = widget.completedExercises.length;
    final totalWorkoutTime = widget.workoutTime;

    String formattedTime() {
      if (totalWorkoutTime < 60) {
        return '$totalWorkoutTime s';
      }
      int totalMinutes = math.max(1, (totalWorkoutTime / 60).round());
      int seconds = totalWorkoutTime % 60;
      String formatted = '${totalMinutes}m ${seconds}s';
      return formatted;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F6FA),
        elevation: 0,
        leading: IconButton(
          onPressed: () =>
              Navigator.popUntil(context, (route) => route.isFirst),
          icon: const Icon(Icons.close, color: Color(0xFF0D1735), size: 30),
        ),
        title: const Text(
          'Session Summary',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF2FF),
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(color: const Color(0xFFD6E7FF)),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'WORKOUT COMPLETE',
                            style: TextStyle(
                              letterSpacing: 4,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1C7BE5),
                            ),
                          ),
                          SizedBox(height: 14),
                          Text(
                            'Great Job,\nAlex!',
                            style: TextStyle(
                              height: 1.05,
                              fontSize: 54,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF0D1735),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        Expanded(
                          child: _buildStatCard(
                            icon: Icons.timer_outlined,
                            label: 'TOTAL TIME',
                            value: formattedTime(),
                            valueSuffix: '',
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: _buildStatCard(
                            icon: Icons.local_fire_department_outlined,
                            label: 'CALORIES',
                            value: '345',
                            valueSuffix: 'kcal',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Expanded(
                          child: _buildSecondaryStatCard(
                            title: 'AVG HEART RATE',
                            value: '145',
                            suffix: 'bpm',
                            trend: '+5%',
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: _buildSecondaryStatCard(
                            title: 'INTENSITY',
                            value: 'High',
                            suffix: '',
                            trend: '+10%',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Exercise Recap',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF0D1735),
                          ),
                        ),
                        Text(
                          '$totalExercises Exercises',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF5E6F8E),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ListView.separated(
                      itemCount: widget.completedExercises.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final name = widget.completedExercises[index];
                        final initials = _initials(name);

                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(color: const Color(0xFFDCE3EE)),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 48,
                                width: 48,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEAF2FF),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFFCCE0FF),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  initials,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF1C7BE5),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF0D1735),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${index + 2} Sets - ${8 + (index * 2)} Reps',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF5E6F8E),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (index == 0)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE5F5EE),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Text(
                                    'PERSONAL BEST',
                                    style: TextStyle(
                                      fontSize: 10,
                                      letterSpacing: 1,
                                      color: Color(0xFF0A8C5E),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Color(0xFFE0E8F2))),
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.widthOf(context) * .8,
                    height: MediaQuery.heightOf(context) * .07,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: WidgetStateProperty.all(2),
                        shadowColor: WidgetStateProperty.all(Colors.black),
                        backgroundColor: WidgetStateProperty.all(
                          Colors.black.withAlpha(180),
                        ),
                        foregroundColor: WidgetStateProperty.all(Colors.white),
                        padding: WidgetStateProperty.all(
                          EdgeInsets.symmetric(vertical: 10),
                        ),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () => {
                        showDialog(
                          context: context,
                          builder: (_) => workLoggedDialog(),
                        ),
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: [
                          Icon(Icons.bookmark, size: 20),
                          Text(
                            "Log Workout",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () =>
                        Navigator.popUntil(context, (route) => route.isFirst),
                    child: const Text(
                      'Back to Home',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF5E6F8E),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String label,
    required String value,
    required String valueSuffix,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFDCE3EE)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF1C7BE5), size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF5E6F8E),
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          RichText(
            text: TextSpan(
              style: const TextStyle(color: Color(0xFF0D1735)),
              children: [
                TextSpan(
                  text: value,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                if (valueSuffix.isNotEmpty)
                  TextSpan(
                    text: ' $valueSuffix',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF5E6F8E),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecondaryStatCard({
    required String title,
    required String value,
    required String suffix,
    required String trend,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFDCE3EE)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFF5E6F8E),
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Color(0xFF0D1735)),
                    children: [
                      TextSpan(
                        text: value,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      if (suffix.isNotEmpty)
                        TextSpan(
                          text: ' $suffix',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF5E6F8E),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE5F5EE),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  trend,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0A8C5E),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _initials(String value) {
    final parts = value.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '';
    if (parts.length == 1) {
      return parts.first
          .substring(0, parts.first.length >= 2 ? 2 : 1)
          .toUpperCase();
    }
    return '${parts.first[0]}${parts[1][0]}'.toUpperCase();
  }

  Widget workLoggedDialog() {
    return AlertDialog(
      icon: Align(
        alignment: Alignment.centerLeft,
        child: Icon(Icons.check_circle, color: Colors.black, size: 40),
      ),
      title: const Text('Workout Logged', textAlign: TextAlign.left),
      content: const Text('Your workout has been logged successfully!'),
      actions: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontWeight: FontWeight.w600),
                  backgroundColor: Colors.black.withAlpha(200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('View Details'),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () =>
                    Navigator.popUntil(context, (route) => route.isFirst),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black87,
                  textStyle: const TextStyle(fontWeight: FontWeight.w600),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.grey, width: 1),
                  ),
                ),
                child: const Text('Back to Home'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
