//result_boxes.dart

import 'package:flutter/material.dart';
import 'package:wort_plus/src/theme/app_colors.dart';

enum ResultBoxesType { learn, quiz }

class ResultBoxes extends StatelessWidget {
  final int points;
  final int learnedPercentage; // % gelernt oder % richtige
  final String timeTaken; // Zeit oder Sekunden pro Frage
  final ResultBoxesType type;

  const ResultBoxes({
    super.key,
    required this.points,
    required this.learnedPercentage,
    required this.timeTaken,
    required this.type,
  });

  /// Text für Quiz-Ergebnis (Box 2)
  String _getQuizPerformanceText(int percentage) {
    if (percentage == 100) return "Perfect";
    if (percentage >= 80) return "Great";
    if (percentage >= 60) return "Good";
    return "Try again";
  }

  /// Text für Geschwindigkeit (Box 3)
  String _getSpeedLabel(String avgSeconds) {
    final double seconds = double.tryParse(avgSeconds.replaceAll("s", "")) ?? 0;
    if (seconds <= 3) return "Fast";
    if (seconds <= 6) return "Normal";
    return "Slow";
  }

  @override
  Widget build(BuildContext context) {
    String title1 = "Points";
    String value1 = "$points";

    String title2;
    String value2;
    String title3;
    String value3;

    if (type == ResultBoxesType.learn) {
      title2 = "Learned";
      value2 = "$learnedPercentage";
      title3 = "Time";
      value3 = timeTaken;
    } else {
      title2 = _getQuizPerformanceText(learnedPercentage);
      value2 = "$learnedPercentage%";
      title3 = "Speed";
      value3 = _getSpeedLabel(timeTaken);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildBox(context, title1, value1),
        const SizedBox(width: 8.0),
        _buildBox(context, title2, value2),
        const SizedBox(width: 8.0),
        _buildBox(context, title3, value3),
      ],
    );
  }

  Widget _buildBox(BuildContext context, String title, String value) {
    return Container(
      width: 100,
      height: 90,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        border: Border.all(color: AppColors.secondaryColor, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(color: AppColors.primaryColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
