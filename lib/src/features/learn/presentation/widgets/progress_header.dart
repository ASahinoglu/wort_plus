//progress_header.dart

import 'package:flutter/material.dart';
import 'package:wort_plus/src/theme/app_colors.dart';

enum ProgressHeaderType { learn, quiz }

class ProgressHeader extends StatelessWidget {
  final int currentIndex;
  final int totalWords;
  final int? remainingLives;
  final ProgressHeaderType type;
  final VoidCallback? onBack;
  final VoidCallback? onForward;
  final bool answeredCurrent;

  const ProgressHeader({
    super.key,
    required this.currentIndex,
    required this.totalWords,
    required this.type,
    this.remainingLives,
    this.onBack,
    this.onForward,
    this.answeredCurrent = false,
  });

  @override
  Widget build(BuildContext context) {
    final double progressValue = (currentIndex + 1) / totalWords;
    final bool canGoBack = currentIndex > 0;
    final bool canGoForward = answeredCurrent && currentIndex < totalWords - 1;

    return Row(
      children: [
        // Close Button
        IconButton(
          icon: const Icon(
            Icons.close,
            color: AppColors.primaryColor,
            size: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
            //TODO:
          },
        ),

        // Back Arrow (nur für Learn)
        if (type == ProgressHeaderType.learn) ...[
          IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: canGoBack
                  ? AppColors.primaryColor
                  : AppColors.disabledPassive,
              size: 30,
            ),
            onPressed: canGoBack ? onBack : null,
          ),
        ],

        // Progress Text
        Text(
          '${currentIndex + 1}/$totalWords',
          style: Theme.of(
            context,
          ).textTheme.labelMedium?.copyWith(color: AppColors.primaryColor),
        ),
        const SizedBox(width: 8.0),

        // Progress Bar
        Expanded(
          child: LinearProgressIndicator(
            value: progressValue,
            backgroundColor: AppColors.disabledPassive,
            color: AppColors.primaryColor,
            minHeight: 8,
            borderRadius: BorderRadius.circular(5),
          ),
        ),

        // Forward Arrow (nur für Learn)
        if (type == ProgressHeaderType.learn) ...[
          const SizedBox(width: 8),
          IconButton(
            icon: Icon(
              Icons.chevron_right,
              color: canGoForward
                  ? AppColors.primaryColor
                  : AppColors.disabledPassive,
              size: 30,
            ),
            onPressed: canGoForward ? onForward : null,
          ),
        ],

        // Hearts für Quiz (nur PNG + Zahl rechts)
        if (type == ProgressHeaderType.quiz && remainingLives != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/heart${remainingLives!.clamp(0, 5)}.png',
                  width: 30,
                  height: 30,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 4),
                Text(
                  remainingLives.toString(),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: (remainingLives ?? 0) >= 3
                        ? AppColors.successColor
                        : AppColors.errorColor,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
