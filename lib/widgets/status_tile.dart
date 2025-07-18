import 'package:flutter/material.dart';
import 'package:wort_plus/utils/app_colors.dart'; // Für die Farbdefinitionen

// Enum, um den Typ der Statusanzeige zu definieren
enum StatusTileType {
  flag, // Für Flaggen wie Deutsch
  streak, // Für Übungs-Streak (Tage, rot/weiß)
  diamonds, // Für Diamant
  hearts, // Für Herzen
}

class StatusTile extends StatefulWidget {
  final StatusTileType type; // Der Typ der Statusanzeige
  final String? targetLanguageCode; // Nur für type: flag (z.B. 'de')
  final int? value; // Für type: streak (Anzahl Tage), diamands , hearts
  final bool? isStreakActive; // Nur für type: streak (true = rot, false = weiß)

  const StatusTile({
    super.key,
    required this.type,
    this.targetLanguageCode,
    this.value,
    this.isStreakActive,
  }) : assert(
         // Assertions, um sicherzustellen, dass die richtigen Parameter für den jeweiligen Typ übergeben werden
         (type == StatusTileType.flag &&
                 targetLanguageCode != null &&
                 value == null &&
                 isStreakActive == null) ||
             (type == StatusTileType.streak &&
                 value != null &&
                 isStreakActive != null &&
                 targetLanguageCode == null) ||
             (type == StatusTileType.diamonds &&
                 value != null &&
                 targetLanguageCode == null &&
                 isStreakActive == null) ||
             (type == StatusTileType.hearts &&
                 value != null &&
                 targetLanguageCode == null &&
                 isStreakActive == null),
         'Ungültige Parameterkombination für StatusTileType: $type',
       );

  @override
  State<StatusTile> createState() => _StatusTileState();
}

class _StatusTileState extends State<StatusTile> {
  @override
  Widget build(BuildContext context) {
    Widget contentWidget; // Widget, das entweder das Icon oder das Bild enthält
    String displayText = ''; // Der Text unter dem Icon/Bild

    switch (widget.type) {
      case StatusTileType.flag:
        // Logik für Flaggen
        contentWidget = ClipOval(
          child: Image.asset(
            'assets/images/${widget.targetLanguageCode!}.png', // z.B. assets/images/de.png
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        );
        // Text entsprechend dem Ländercode anpassen
        switch (widget.targetLanguageCode) {
          case 'de':
            displayText = 'German';
            break;
          // Fügen Sie hier weitere Fälle für andere Sprachen hinzu (z.B. 'en': displayText = 'English';)
          default:
            displayText = 'Langueage'; // Fallback
        }
        break;

      case StatusTileType.streak:
        // Logik für Übungs-Streak (Tage)
        contentWidget = Icon(
          Icons.local_fire_department,
          color: widget.isStreakActive!
              ? AppColors.textColor
              : AppColors.backgroundColor, // Rot wenn aktiv, Weiß wenn inaktiv
          size: 36,
        );
        displayText = '${widget.value!} Days'; // z.B. "7 Tage"
        break;

      case StatusTileType.diamonds:
        // Diamant
        contentWidget = Icon(
          Icons.diamond,
          color: AppColors.textColor,
          size: 36,
        );
        displayText = widget.value!.toString(); // z.B. "500"
        break;

      case StatusTileType.hearts:
        // Logik für Herzen
        final int clampedHearts = widget.value!.clamp(
          0,
          5,
        ); // Sicherstellen, dass der Wert zwischen 0 und 5 liegt
        final String heartImagePath =
            'assets/images/heart$clampedHearts.png'; // z.B. assets/images/heart3.png
        contentWidget = Image.asset(heartImagePath, width: 50, height: 50);
        displayText = widget.value!.toString(); // z.B. "5"
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
