// word_card.dart

// word_card.dart

import 'package:flutter/material.dart';
import 'package:wort_plus/src/theme/app_colors.dart';
import 'package:wort_plus/src/common/custom_elevated_button.dart';
import '../learning_screen.dart';

class WordCard extends StatelessWidget {
  final String foreignWord;
  final String foreignExample;
  final String nativeWord;
  final String nativeExample;
  final WordStatus status;
  final VoidCallback? onAudioPressed;
  final VoidCallback? onPracticeAgainPressed;
  final VoidCallback? onIKnowItPressed;

  const WordCard({
    super.key,
    this.foreignWord = 'das Haus',
    this.foreignExample = 'Ich habe ein Haus',
    this.nativeWord = 'The House',
    this.nativeExample = 'I have a house',
    this.status = WordStatus.none,
    this.onAudioPressed,
    this.onPracticeAgainPressed,
    this.onIKnowItPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 388.0,
        maxHeight: screenHeight * 0.55,
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.learnBackground,
          border: Border.all(color: AppColors.secondaryColor, width: 3.0),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.secondaryColor,
              offset: const Offset(0, 2),
              blurRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Audio Button oben rechts
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: onAudioPressed,
                  icon: const Icon(
                    Icons.volume_up,
                    size: 32,
                    color: Colors.white,
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      AppColors.primaryColor,
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Inhalte
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 16.0),
                Text(
                  foreignWord,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12.0),
                Text(
                  foreignExample,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: AppColors.textColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12.0),
                Divider(color: AppColors.secondaryColor, thickness: 1.0),
                const SizedBox(height: 12.0),
                Text(
                  nativeWord,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12.0),
                Text(
                  nativeExample,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: AppColors.textColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.0),
              ],
            ),

            // Buttons unten
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    text: "Practice again",

                    onPressed: onPracticeAgainPressed,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomElevatedButton(
                    text: "I know it",

                    onPressed: onIKnowItPressed,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
