// quizzing_screen.dart

import 'package:flutter/material.dart';
import 'package:wort_plus/src/features/learn/presentation/widgets/progress_header.dart';
import 'package:wort_plus/src/features/learn/presentation/result_screen.dart';
import 'package:wort_plus/src/theme/app_colors.dart';
import 'package:wort_plus/src/common/custom_elevated_button.dart';

class WordQuizzingScreen extends StatefulWidget {
  const WordQuizzingScreen({super.key});

  @override
  State<WordQuizzingScreen> createState() => _WordQuizzingScreenState();
}

class _WordQuizzingScreenState extends State<WordQuizzingScreen> {
  int currentIndex = 0;
  int correctAnswers = 0;
  int remainingLives = 3;
  bool answered = false;
  int? selectedIndex;

  final List<Map<String, String>> words = [
    {"foreign": "Haus", "native": "House"},
    {"foreign": "Baum", "native": "Tree"},
    {"foreign": "Wasser", "native": "Water"},
    {"foreign": "Buch", "native": "Book"},
    {"foreign": "Stuhl", "native": "Chair"},
    {"foreign": "Apfel", "native": "Apple"},
    {"foreign": "Straße", "native": "Street"},
    {"foreign": "Tür", "native": "Door"},
    {"foreign": "Fenster", "native": "Window"},
    {"foreign": "Katze", "native": "Cat"},
    {"foreign": "Hund", "native": "Dog"},
    {"foreign": "Sonne", "native": "Sun"},
    {"foreign": "Mond", "native": "Moon"},
    {"foreign": "Brot", "native": "Bread"},
    {"foreign": "Milch", "native": "Milk"},
    {"foreign": "Auto", "native": "Car"},
    {"foreign": "Blume", "native": "Flower"},
    {"foreign": "Berg", "native": "Mountain"},
    {"foreign": "Meer", "native": "Sea"},
    {"foreign": "Freund", "native": "Friend"},
  ];

  List<String> currentOptions = [];

  @override
  void initState() {
    super.initState();
    _generateOptions();
  }

  void _generateOptions() {
    final correct = words[currentIndex]["native"]!;
    final allOptions = words.map((e) => e["native"]!).toList();

    allOptions.remove(correct);
    allOptions.shuffle();

    currentOptions = [correct, ...allOptions.take(3)];
    currentOptions.shuffle();
  }

  void _onAnswerTap(int index) {
    if (answered) return;

    setState(() {
      answered = true;
      selectedIndex = index;

      final correct = words[currentIndex]["native"];
      if (currentOptions[index] == correct) {
        correctAnswers++;
      } else {
        remainingLives--;
      }
    });
  }

  void _nextQuestion() {
    if (currentIndex == words.length - 1) {
      // 👉 Fertig → ResultScreen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            type: ResultScreenType.quiz,
            points: correctAnswers * 10,
            learnedPercentage: ((correctAnswers / words.length) * 100).round(),
            timeTaken: "2:34", // ⬅️ später dynamisch
          ),
        ),
      );
      return;
    }

    setState(() {
      currentIndex++;
      answered = false;
      selectedIndex = null;
      _generateOptions();
    });
  }

  @override
  Widget build(BuildContext context) {
    final word = words[currentIndex]["foreign"]!;
    final correct = words[currentIndex]["native"]!;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24.0),
              ProgressHeader(
                currentIndex: currentIndex,
                totalWords: words.length,
                type: ProgressHeaderType.quiz,
                remainingLives: remainingLives,
              ),
              const SizedBox(height: 36.0),

              Text(
                "Choose the correct answer...",
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 36.0),

              // Foreign word box
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: 120),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.secondaryColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      word,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(color: AppColors.textColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 36),

              // Answer options
              ...List.generate(currentOptions.length, (i) {
                final option = currentOptions[i];
                //TODO: für farbe überleg und andere lösung
                Color bgColor = AppColors.primaryColor;
                Color fgColor = AppColors.textColor;
                if (answered) {
                  if (option == correct) {
                    bgColor = AppColors.successColor; // ✅ grün
                  } else if (i == selectedIndex && option != correct) {
                    bgColor = AppColors.errorColor; // ❌ rot
                    fgColor = AppColors.backgroundColor;
                  } else {
                    bgColor = AppColors.disabledPassive; // grau
                  }
                }

                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    width: 300.0,
                    height: 50.0,
                    child: ElevatedButton(
                      //TODO: eigene button oder neue für quiz
                      style: ElevatedButton.styleFrom(
                        backgroundColor: bgColor,
                        foregroundColor: fgColor,
                        padding: const EdgeInsets.all(4.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),

                      onPressed: () => _onAnswerTap(i),
                      child: Text(option, style: const TextStyle(fontSize: 18)),
                    ),
                  ),
                );
              }),

              const Spacer(),

              // Next / Finish button
              CustomElevatedButton(
                text: currentIndex == words.length - 1 ? "Finish" : "Next",
                width: 240.0,
                onPressed: answered ? _nextQuestion : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
