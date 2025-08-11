import 'package:flutter/material.dart';
import 'package:wort_plus/src/theme/app_colors.dart';
import 'package:wort_plus/src/common/custom_elevated_button.dart';

enum LevelCardType { learn, quiz }

class LevelCard extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final LevelCardType type;

  const LevelCard({
    super.key,
    required this.title,
    required this.description,
    this.buttonText = 'Start',
    this.type = LevelCardType.learn, //default
  });

  @override
  Widget build(BuildContext context) {
    final isQuiz = type == LevelCardType.quiz;
    final borderColor = isQuiz
        ? AppColors.secondaryColor
        : AppColors.secondaryColor;
    final shadowColor = isQuiz
        ? AppColors.secondaryColor
        : AppColors.secondaryColor;
    final backgroundColor = isQuiz
        ? AppColors.quizBackground
        : AppColors.learnBackground;
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 3.0),
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            offset: const Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text(description, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.centerRight,
            child: CustomElevatedButton(text: buttonText, onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
