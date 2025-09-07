// learning_screen.dart

import 'package:flutter/material.dart';
import 'package:wort_plus/src/common/custom_elevated_button.dart';
import 'package:wort_plus/src/features/learn/presentation/result_screen.dart';
import 'package:wort_plus/src/theme/app_colors.dart';
import 'package:wort_plus/src/features/learn/presentation/widgets/word_card.dart';
import 'package:wort_plus/src/features/learn/presentation/widgets/progress_header.dart';
import 'package:wort_plus/src/data/repositories/mocks/mock_word_repository.dart';
import 'package:wort_plus/src/data/models/word_translation.dart';
import 'dart:async';

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

  List<WordStatus> _answers = [];
  int _iKnowItCount = 0;

  late Future<List<WordTranslation>> _wordsFuture;

  @override
  void initState() {
    super.initState();
    _answers = List.filled(totalWords, WordStatus.none);

    // ✅ Future initialisieren
    final mockRepo = MockWordRepository();
    mockRepo.initMockData();
    _wordsFuture = Future.delayed(
      const Duration(seconds: 1),
      () => mockRepo.getAllTranslations(),
    );
  }

  bool get allAnswered => _answers.every((status) => status != WordStatus.none);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: FutureBuilder<List<WordTranslation>>(
            future: _wordsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No words found.'));
              }

              final words = snapshot.data!.take(totalWords).toList();

              return Column(
                children: [
                  const SizedBox(height: 22.0),

                  // Progress Header
                  ProgressHeader(
                    currentIndex: _currentWordIndex,
                    totalWords: words.length,
                    type: ProgressHeaderType.learn,
                    remainingLives: 3, // Beispiel, später AppData.hearts
                    onBack: () {
                      setState(() {
                        if (_currentWordIndex > 0) _currentWordIndex--;
                      });
                    },
                    onForward: () {
                      setState(() {
                        if (_answers[_currentWordIndex] != WordStatus.none &&
                            _currentWordIndex < words.length - 1) {
                          _currentWordIndex++;
                        }
                      });
                    },
                    answeredCurrent:
                        _answers[_currentWordIndex] != WordStatus.none,
                  ),

                  const SizedBox(height: 110.0),

                  // Word Card
                  Expanded(
                    child: Center(
                      child: WordCard(
                        foreignWord: words[_currentWordIndex].baseWord ?? '',
                        foreignExample:
                            words[_currentWordIndex].exampleSentence ?? '',
                        nativeWord: words[_currentWordIndex].baseWord ?? '',
                        nativeExample:
                            words[_currentWordIndex].exampleSentence ?? '',
                        onPracticeAgainPressed: () {
                          setState(() {
                            if (_answers[_currentWordIndex] ==
                                WordStatus.iKnowIt) {
                              _iKnowItCount--;
                            }
                            _answers[_currentWordIndex] =
                                WordStatus.practiceAgain;

                            if (_currentWordIndex < words.length - 1) {
                              _currentWordIndex++;
                            }
                          });
                        },
                        onIKnowItPressed: () {
                          setState(() {
                            if (_answers[_currentWordIndex] !=
                                WordStatus.iKnowIt) {
                              _iKnowItCount++;
                            }
                            _answers[_currentWordIndex] = WordStatus.iKnowIt;

                            if (_currentWordIndex < words.length - 1) {
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
              );
            },
          ),
        ),
      ),
    );
  }
}
