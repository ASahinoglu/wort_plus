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
                children: const [
                  StatusTile(
                    flagImagePath: 'assets/images/de.png',
                    label: 'German',
                  ),
                  StatusTile(
                    iconData: Icons.local_fire_department,
                    label: '7 Days',
                  ),
                  StatusTile(iconData: Icons.diamond, label: '500'),
                  StatusTile(iconData: Icons.favorite, label: '5'),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 2. Profil-Informationen
            ProfileHeader(
              userName: 'Aydin',
              mottoText: 'Word by word to success.',
            ),
            const SizedBox(height: 24),

            // 3. Erweiterbarer und scrollbarer Bereich für den Inhalt
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
                              // StatCards
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

                              // Fortschrittsanzeigen Überschrift
                              Text(
                                'Your Level Progress',
                                style: Theme.of(context).textTheme.headlineSmall
                                    ?.copyWith(color: AppColors.textColor),
                              ),
                              const SizedBox(height: 16),

                              // Fortschrittsanzeigen
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
                              // Test için eklenen kartlar (kaydırmayı doğrulamak için)
                              ProgressIndicatorCard(
                                title: 'B1 (Test)',
                                progressValue: 0.75,
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
            SizedBox(height: 16),

            // "Let's go" Button (Sabitlenen kısım)
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
            const SizedBox(height: 16), // BottomNavigationBar'a olan mesafe
          ],
        ),
      ),
    );
  }
}
