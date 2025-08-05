import 'package:flutter/material.dart';
import 'package:wort_plus/src/theme/app_colors.dart'; // Für die Farbdefinitionen

class ProfileHeader extends StatelessWidget {
  final String userName; // Der Name des Benutzers (z.B. "Aydin")
  final String mottoText; // Der Motivations- oder Slogan-Text

  const ProfileHeader({
    super.key,
    required this.userName,
    required this.mottoText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor, // Hintergrundfarbe des Headers
      // Nur vertikalen Padding auf den Container anwenden, damit die Farbe durchgeht
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Padding(
        // NEU: Padding für den Inhalt der Row
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ), // Horizontalen Padding hier anwenden
        child: Row(
          // Keine explizite mainAxisAlignment, da das Settings-Icon entfernt wurde.
          // Die Inhalte beginnen links.
          children: [
            // Avatar und Begrüßungstext
            CircleAvatar(
              radius: 30, // Avatar-Größe
              backgroundColor: AppColors.disabledPassive,
              child: Icon(Icons.person, color: AppColors.textColor, size: 30),
            ),
            const SizedBox(width: 16), // Abstand zwischen Avatar und Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi $userName', // Benutzername dynamisch einfügen
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.textColor,
                  ),
                ),
                Text(
                  mottoText, // Motivations-Text dynamisch einfügen
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: AppColors.textColor),
                ),
              ],
            ),
            // Spacer füllt den verbleibenden Platz rechts, wenn kein Settings-Icon vorhanden ist
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
