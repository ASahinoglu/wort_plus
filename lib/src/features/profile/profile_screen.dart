import 'package:flutter/material.dart';
import 'package:wort_plus/src/theme/app_colors.dart';
import 'package:wort_plus/src/common/status_tile.dart';
import 'package:wort_plus/src/common/profile_header.dart';
import 'package:wort_plus/src/common/settings_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Status Tiles
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
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
            const ProfileHeader(
              userName: 'Username',
              mottoText: 'Learner since 05/2025',
            ),
            const SizedBox(height: 16),

            // ✅ Settings Liste
            Expanded(
              child: ListView(
                children: const [
                  SettingsTile(title: 'Account'),
                  SettingsTile(title: 'Language'),
                  SettingsTile(title: 'Notifications'),
                  SettingsTile(title: 'Settings'),
                  SettingsTile(title: 'Contact'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
