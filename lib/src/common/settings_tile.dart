import 'package:flutter/material.dart';
import 'package:wort_plus/src/theme/app_colors.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const SettingsTile({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(color: AppColors.textColor),
          ),
          trailing: const Icon(
            Icons.chevron_right,
            color: Colors.white,
            size: 36.0,
          ),
          onTap: onTap,
        ),
        Divider(color: AppColors.secondaryColor, height: 5, thickness: 1),
      ],
    );
  }
}
