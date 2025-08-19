import 'package:flutter/material.dart';
import 'package:wort_plus/src/theme/app_colors.dart';
import 'package:wort_plus/src/common/stat_card.dart';
import 'package:wort_plus/src/common/progress_indicator_card.dart';
import 'package:wort_plus/src/common/status_tile.dart';
import 'package:wort_plus/src/common/profile_header.dart';
import 'package:wort_plus/src/common/custom_elevated_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ 1. Status-Leiste (mit zentralen Werten aus AppData)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 0.0,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  StatusTile(type: StatusTileType.flag),
                  StatusTile(type: StatusTileType.streak),
                  StatusTile(type: StatusTileType.diamonds),
                  StatusTile(type: StatusTileType.hearts),
                ],
              ),
            ),

            const SizedBox(height: 18),
            // ✅ Profil Header
            ProfileHeader(
              userName: 'Aydin',
              mottoText: 'Word by word to success.',
            ),
            const SizedBox(height: 20),
            // ✅ Inhalt
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
                          // ✅ Stat Cards
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: const [
                                  StatCard(
                                    value: '1100',
                                    label: 'Total Points',
                                  ),
                                  SizedBox(width: 24),
                                  StatCard(
                                    value: '550',
                                    label: 'Words Learned',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 28),

                              Row(
                                children: const [
                                  StatCard(value: '87%', label: 'Quiz Success'),
                                  SizedBox(width: 24),
                                  StatCard(
                                    value: '5 hrs 10 mins',
                                    label: 'Total Time',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              // ✅ Progress Cards
                              ProgressIndicatorCard(
                                title: 'A1',
                                progressValue: 0.80,
                                progressColor: AppColors.primaryColor,
                              ),
                              const SizedBox(height: 8),
                              ProgressIndicatorCard(
                                title: 'A2',
                                progressValue: 0.50,
                                progressColor: AppColors.primaryColor,
                              ),
                              const SizedBox(height: 8),
                              ProgressIndicatorCard(
                                title: 'B1 (Test)',
                                progressValue: 0.75,
                                progressColor: AppColors.primaryColor,
                              ),
                              const SizedBox(height: 8),
                              ProgressIndicatorCard(
                                title: 'B2 (Test)',
                                progressValue: 0.40,
                                progressColor: AppColors.primaryColor,
                              ),
                              const SizedBox(height: 8),
                              ProgressIndicatorCard(
                                title: 'C1 (Test)',
                                progressValue: 0.20,
                                progressColor: AppColors.primaryColor,
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              // ✅ Button
              child: Center(
                child: CustomElevatedButton(
                  text: 'Let\'s go',
                  width: 150.0,
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
