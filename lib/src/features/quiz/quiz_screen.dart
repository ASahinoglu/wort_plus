import 'package:flutter/material.dart';
import 'package:wort_plus/src/common/status_tile.dart';
import '../quiz/level_card.dart';
import 'package:wort_plus/src/common/section_header.dart';
import 'package:wort_plus/src/common/segment_switcher.dart';
import 'package:wort_plus/src/theme/app_colors.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<QuizScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Obere Status-Leiste
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  StatusTile(type: StatusTileType.flag),
                  StatusTile(type: StatusTileType.streak),
                  StatusTile(type: StatusTileType.diamonds),
                  StatusTile(type: StatusTileType.hearts),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ✅ Titel + Untertitel
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: SectionHeader(
                title: 'Quiz',
                subtitle: 'Test your vocabulary knowledge!',
              ),
            ),
            const SizedBox(height: 16),

            // ✅ SegmentSwitcher (Tabs)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SegmentSwitcher(
                selectedIndex: selectedTab,
                onTabChanged: (index) {
                  setState(() {
                    selectedTab = index;
                  });
                },
                type: SegmentSwitcherType.quiz,
              ),
            ),
            const SizedBox(height: 24),

            // ✅ Inhalt je nach Tab
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _buildContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (selectedTab == 0) {
      // ✅ LEVEL-TAB
      return ListView(
        children: const [
          LevelCard(
            title: 'A1 (Beginner)',
            description:
                'You understand and use simple words and phrases for everyday situations.',
            buttonText: 'Begin',
            type: LevelCardType.quiz,
          ),
          SizedBox(height: 24),
          LevelCard(
            title: 'A2 (Elementary)',
            description:
                'You understand common expressions and can communicate in basic daily situations.',
            buttonText: 'Begin',
            type: LevelCardType.quiz,
          ),
        ],
      );
    } else {
      // ✅ WORD TYPES TAB
      return ListView(
        children: const [
          LevelCard(
            title: 'Pronouns',
            description:
                'Replace nouns to avoid repetition or to refer back to something.',
            buttonText: 'Begin',
            type: LevelCardType.quiz,
          ),
          SizedBox(height: 24),
          LevelCard(
            title: 'Prepositions',
            description:
                'Show relationships between words or parts of a sentence.',
            buttonText: 'Begin',
            type: LevelCardType.quiz,
          ),
        ],
      );
    }
  }
}
