//result_card.dart

import 'package:flutter/material.dart';
import 'package:wort_plus/src/theme/app_colors.dart';

enum ResultCardType { learn, quiz }

class ResultCard extends StatelessWidget {
  final ResultCardType type;
  final int progress;
  // bei Learn = Anzahl Wörter
  // bei Quiz = Prozent richtig

  const ResultCard({super.key, required this.type, required this.progress});

  // 🔥 Helper für Titel, Untertitel & Bild
  Map<String, String> _getContent() {
    if (type == ResultCardType.learn) {
      if (progress < 5) {
        return {
          "title": "Good start! 🚀",
          "subtitle":
              "You’ve learned $progress words. Keep building your base!",
          "image": "assets/images/result0.png",
        };
      } else if (progress < 15) {
        return {
          "title": "Nice progress! 🌱",
          "subtitle":
              "Already $progress words learned. Step by step you grow stronger.",
          "image": "assets/images/result1.png",
        };
      } else {
        return {
          "title": "Word Master! 📚",
          "subtitle": "Incredible! $progress words already in your vocabulary.",
          "image": "assets/images/result0.png",
        };
      }
    } else {
      // ✅ Quiz Mode
      if (progress == 100) {
        return {
          "title": "Perfect! 🏆",
          "subtitle": "All answers correct. You’re unstoppable!",
          "image": "assets/images/result0.png",
        };
      } else if (progress >= 80) {
        return {
          "title": "Great job! 💎",
          "subtitle": "$progress% correct. Just a few more to perfection!",
          "image": "assets/images/result1.png",
        };
      } else if (progress >= 60) {
        return {
          "title": "Keep going! 🔥",
          "subtitle": "$progress% correct. Solid, but you can do even better!",
          "image": "assets/images/result0.png",
        };
      } else {
        return {
          "title": "Don’t give up! 💪",
          "subtitle": "Only $progress%. Try again and improve step by step.",
          "image": "assets/images/result1.png",
        };
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = _getContent();

    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        border: Border.all(color: AppColors.secondaryColor, width: 2),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondaryColor,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              content["image"]!,
              height: 240.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 24.0),
          Text(
            content["title"]!,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12.0),
          Text(
            content["subtitle"]!,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppColors.textColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
