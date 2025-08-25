//result_screen.dart

import 'package:flutter/material.dart';
import 'package:wort_plus/src/features/learn/presentation/learn_screen.dart';
import 'package:wort_plus/src/features/learn/presentation/widgets/result_boxes.dart';
import 'package:wort_plus/src/features/learn/presentation/widgets/result_card.dart';
import 'package:wort_plus/src/theme/app_colors.dart';
import 'package:wort_plus/src/common/custom_elevated_button.dart';

enum ResultScreenType { learn, quiz }

class ResultScreen extends StatelessWidget {
  final int points;
  final int learnedPercentage;
  final String timeTaken;
  final ResultScreenType type;

  const ResultScreen({
    super.key,
    required this.points,
    required this.learnedPercentage,
    required this.timeTaken,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 20.0),

                ResultCard(
                  type: type == ResultScreenType.learn
                      ? ResultCardType.learn
                      : ResultCardType.quiz,
                  progress: type == ResultScreenType.learn
                      ? learnedPercentage // bei Learn = Anzahl Wörter
                      : learnedPercentage, // bei Quiz = Prozent richtig
                ),

                const SizedBox(height: 32.0),

                ResultBoxes(
                  points: points,
                  learnedPercentage: learnedPercentage,
                  timeTaken: timeTaken,
                  type: type == ResultScreenType.learn
                      ? ResultBoxesType.learn
                      : ResultBoxesType.quiz,
                ),

                const SizedBox(height: 32),

                CustomElevatedButton(
                  text: "Earn points",
                  width: 240.0,
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const LearnScreen(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                ),

                const SizedBox(height: 36.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
