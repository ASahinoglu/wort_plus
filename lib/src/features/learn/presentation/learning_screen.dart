// learning_screen.dart

import 'package:flutter/material.dart';
import 'package:wort_plus/src/common/custom_elevated_button.dart';
import 'package:wort_plus/src/features/learn/presentation/result_screen.dart';
import 'package:wort_plus/src/theme/app_colors.dart';
import 'package:wort_plus/src/features/learn/presentation/widgets/word_card.dart';
import 'package:wort_plus/src/features/learn/presentation/widgets/progress_header.dart';
import 'package:wort_plus/src/data/app_data.dart';

// Status pro Wort
enum WordStatus { none, iKnowIt, practiceAgain }

class WordLearningScreen extends StatefulWidget {
  const WordLearningScreen({super.key});

  @override
  WordLearningScreenState createState() => WordLearningScreenState();
}

class WordLearningScreenState extends State<WordLearningScreen> {
  final int totalWords = 20;
  int _currentWordIndex = 0;

  late List<WordStatus> _answers;
  int _iKnowItCount = 0;

  @override
  void initState() {
    super.initState();
    _answers = List.filled(totalWords, WordStatus.none);
  }

  bool get allAnswered => _answers.every((status) => status != WordStatus.none);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 22.0),

              // Progress Header
              ProgressHeader(
                currentIndex: _currentWordIndex,
                totalWords: totalWords,
                type: ProgressHeaderType.learn,
                remainingLives: AppData.hearts,
                onBack: () {
                  setState(() {
                    if (_currentWordIndex > 0) _currentWordIndex--;
                  });
                },
                onForward: () {
                  setState(() {
                    if (_answers[_currentWordIndex] != WordStatus.none &&
                        _currentWordIndex < totalWords - 1) {
                      _currentWordIndex++;
                    }
                  });
                },
                answeredCurrent: _answers[_currentWordIndex] != WordStatus.none,
              ),

              const SizedBox(height: 110.0),

              // Word Card
              Expanded(
                child: Center(
                  child: WordCard(
                    foreignWord: "das HausdasHausdas",
                    foreignExample: "Ich habe ein Haus",
                    nativeWord: "The house",
                    nativeExample: "I have a house",
                    onPracticeAgainPressed: () {
                      setState(() {
                        if (_answers[_currentWordIndex] == WordStatus.iKnowIt) {
                          _iKnowItCount--;
                        }
                        _answers[_currentWordIndex] = WordStatus.practiceAgain;

                        if (_currentWordIndex < totalWords - 1) {
                          _currentWordIndex++;
                        }
                      });
                    },
                    onIKnowItPressed: () {
                      setState(() {
                        if (_answers[_currentWordIndex] != WordStatus.iKnowIt) {
                          _iKnowItCount++;
                        }
                        _answers[_currentWordIndex] = WordStatus.iKnowIt;

                        if (_currentWordIndex < totalWords - 1) {
                          _currentWordIndex++;
                        }
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Finish Button
              SizedBox(
                height: 40,
                child: allAnswered
                    ? CustomElevatedButton(
                        text: "Finish",
                        width: 240.0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                type: ResultScreenType.learn,
                                points: 40,
                                learnedPercentage: _iKnowItCount,
                                timeTaken: "1:37",
                              ),
                            ),
                          );
                        },
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
