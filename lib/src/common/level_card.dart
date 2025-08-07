import 'package:flutter/material.dart';
import 'package:wort_plus/src/theme/app_colors.dart';
import 'package:wort_plus/src/common/custom_elevated_button.dart';

class LevelCard extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;

  const LevelCard({
    super.key,
    required this.title,
    required this.description,
    this.buttonText = 'Start',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondaryColor, width: 3.00),
        borderRadius: BorderRadius.circular(12),
        color: AppColors.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.secondaryColor,
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
