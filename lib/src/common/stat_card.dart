import 'package:flutter/material.dart';
import 'package:wort_plus/src/theme/app_colors.dart'; // Für die Farbdefinitionen

class StatCard extends StatefulWidget {
  final String value; // Der Wert (z.B. "500" oder "100")
  final String
  label; // Die Beschriftung (z.B. "Total Points" oder "Words learned")

  const StatCard({super.key, required this.value, required this.label});

  @override
  State<StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<StatCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        constraints: BoxConstraints(minHeight: 90.0, minWidth: 150.0),

        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          // Hintergrund mit leichter Primärfarbe
          borderRadius: BorderRadius.circular(12), // Abgerundete Ecken
          border: Border.all(
            color: AppColors.secondaryColor,
            width: 2.0,
          ), // Leichter Rahmen
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Inhalt linksbündig ausrichten
          children: [
            // Zuerst die Beschriftung (Label)
            Text(
              widget.label, // Angezeigte Beschriftung
              style: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(color: AppColors.primaryColor),
            ),
            const SizedBox(height: 8), // Abstand zwischen Beschriftung und Wert
            // Dann der Wert (Value)
            Text(
              widget.value, // Angezeigter Wert
              style: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(color: AppColors.textColor),
            ),
          ],
        ),
      ),
    );
  }
}
