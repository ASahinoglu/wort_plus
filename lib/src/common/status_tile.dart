import 'package:flutter/material.dart';
import 'package:wort_plus/src/theme/app_colors.dart';
import 'package:wort_plus/src/data/app_data.dart'; // Für die Farbdefinitionen

// Enum, um den Typ der Statusanzeige zu definieren
enum StatusTileType {
  flag, // Für Flaggen wie Deutsch
  streak, // Für Übungs-Streak (Tage, rot/weiß)
  diamonds, // Für Diamant
  hearts, // Für Herzen
}

class StatusTile extends StatelessWidget {
  final StatusTileType type; // Der Typ der Statusanzeige

  const StatusTile({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    Widget contentWidget; // Widget, das entweder das Icon oder das Bild enthält
    String displayText = ''; // Der Text unter dem Icon/Bild

    switch (type) {
      case StatusTileType.flag:
        // Logik für Flaggen
        contentWidget = ClipOval(
          child: Image.asset(
            'assets/images/${AppData.targetLanguageCode}.png', // z.B. assets/images/de.png
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        );
        // Text entsprechend dem Ländercode anpassen
        switch (AppData.targetLanguageCode) {
          case 'de':
            displayText = 'German';
            break;
          // Fügen Sie hier weitere Fälle für andere Sprachen hinzu (z.B. 'en': displayText = 'English';)
          default:
            displayText = 'Language'; // Fallback
        }
        break;

      case StatusTileType.streak:
        // Logik für Übungs-Streak (Tage)
        contentWidget = Icon(
          Icons.local_fire_department,
          color: AppData.isTodayStreakActive
              ? AppColors.textColor
              : AppColors.backgroundColor, // Rot wenn aktiv, Weiß wenn inaktiv
          size: 36,
        );
        displayText = '${AppData.streakDays} Days'; // z.B. "7 Tage"
        break;

      case StatusTileType.diamonds:
        // Diamant
        contentWidget = Icon(
          Icons.diamond,
          color: AppColors.textColor,
          size: 36,
        );
        displayText = AppData.diamonds.toString(); // z.B. "500"
        break;

      case StatusTileType.hearts:
        // Logik für Herzen
        final int clampedHearts = AppData.hearts.clamp(
          0,
          AppData.maxHearts,
        ); // Sicherstellen, dass der Wert zwischen 0 und 5 liegt
        final String heartImagePath =
            'assets/images/heart$clampedHearts.png'; // z.B. assets/images/heart3.png
        contentWidget = Image.asset(heartImagePath, width: 50, height: 50);
        displayText = AppData.hearts.toString(); // z.B. "5"
        break;
    }

    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.secondaryColor, width: 2),
            ),
            child: Center(
              child: contentWidget, // Zeigt den spezifischen Inhalt an
            ),
          ),
          const SizedBox(height: 8),
          Text(
            displayText, // Zeigt den dynamisch generierten Text an
            style: Theme.of(
              context,
            ).textTheme.labelMedium?.copyWith(color: AppColors.textColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
