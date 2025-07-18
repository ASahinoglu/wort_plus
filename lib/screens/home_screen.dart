import 'package:flutter/material.dart';
import 'package:wort_plus/utils/app_colors.dart';
// Importiere benutzerdefinierte Widgets
import 'package:wort_plus/widgets/stat_card.dart';
import 'package:wort_plus/widgets/progress_indicator_card.dart';
import 'package:wort_plus/widgets/status_tile.dart';
import 'package:wort_plus/widgets/profile_header.dart';
import 'package:wort_plus/widgets/custom_elevated_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Beispiel: Simulierte Werte für die Status-Anzeigen
    const int currentHearts = 1;
    const int currentStreakDays = 7;
    const bool isTodayStreakActive = false; // Beispiel: Heute geübt
    const int totalDiamonds = 500;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Status-Leiste
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 0.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Flagge Zielsprache
                  const StatusTile(
                    type: StatusTileType.flag,
                    targetLanguageCode: 'de',
                  ),
                  // Streak (7 Tage, aktiv)
                  const StatusTile(
                    type: StatusTileType.streak,
                    value: currentStreakDays,
                    isStreakActive: isTodayStreakActive,
                  ),
                  // Diamant
                  const StatusTile(
                    type: StatusTileType.diamonds,
                    value: totalDiamonds,
                  ),
                  // Herzen
                  StatusTile(type: StatusTileType.hearts, value: currentHearts),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // ... Rest HomeScreen-Codes
            ProfileHeader(
              userName: 'Aydin',
              mottoText: 'Word by word to success.',
            ),
            const SizedBox(height: 24),

            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  StatCard(
                                    value: '1100',
                                    label: 'Total Points',
                                  ),
                                  SizedBox(width: 16),
                                  StatCard(
                                    value: '550',
                                    label: 'Words Learned',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),

                              Row(
                                children: const [
                                  StatCard(value: '87%', label: 'Quiz Success'),
                                  SizedBox(width: 16),
                                  StatCard(
                                    value: '5 hrs 10 mins',
                                    label: 'Total Time',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),

                              ProgressIndicatorCard(
                                title: 'A1',
                                progressValue: 0.80,
                                progressColor: AppColors.primaryColor,
                              ),
                              const SizedBox(height: 16),
                              ProgressIndicatorCard(
                                title: 'A2',
                                progressValue: 0.50,
                                progressColor: AppColors.primaryColor,
                              ),
                              const SizedBox(height: 16),
                              ProgressIndicatorCard(
                                title: 'B1 (Test)',
                                progressValue: 0.75,
                                progressColor: AppColors.primaryColor,
                              ),
                              const SizedBox(height: 16),
                              ProgressIndicatorCard(
                                title: 'B2 (Test)',
                                progressValue: 0.40,
                                progressColor: AppColors.primaryColor,
                              ),
                              const SizedBox(height: 16),
                              ProgressIndicatorCard(
                                title: 'C1 (Test)',
                                progressValue: 0.20,
                                progressColor: AppColors.primaryColor,
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: CustomElevatedButton(
                  text: 'Let\'s go',
                  onPressed: () {
                    print('Let\'s go Button getippt');
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
