import 'package:flutter/material.dart';
import 'package:wort_plus/utils/app_colors.dart'; // Für die Farbdefinitionen

class StatusTile extends StatefulWidget {
  final String
  label; // Der Text unter dem Icon (z.B. "German", "7 Days", "500", "5")
  final String? flagImagePath; // Optionaler Pfad zum Flaggenbild
  final IconData? iconData; // Optionales IconData für Material Icons

  // Konstruktor, der entweder flagImagePath ODER iconData erfordert
  const StatusTile({
    super.key,
    required this.label,
    this.flagImagePath,
    this.iconData,
  }) : assert(
         flagImagePath != null || iconData != null,
         'Entweder flagImagePath oder iconData muss angegeben werden.',
       ); // Sicherstellen, dass mindestens eines übergeben wird

  @override
  State<StatusTile> createState() => _StatusTileState();
}

class _StatusTileState extends State<StatusTile> {
  @override
  Widget build(BuildContext context) {
    Widget contentWidget; // Widget, das entweder das Icon oder das Bild enthält

    if (widget.flagImagePath != null) {
      // Wenn ein Flaggenbildpfad angegeben ist
      contentWidget = ClipOval(
        // ClipOval, um das Bild im Kreis zu beschneiden
        child: Image.asset(
          widget.flagImagePath!, // Verwende das Flaggenbild
          width: 36, // Bildgröße (etwas kleiner als der Container)
          height: 36,
          fit: BoxFit.cover, // Bild ausfüllen, ohne Verzerrung
        ),
      );
    } else if (widget.iconData != null) {
      // Wenn IconData angegeben ist
      contentWidget = Icon(
        widget.iconData, // Verwende das Material Icon
        color: AppColors.textColor, // Icon-Farbe
        size: 36, // Icon-Größe
      );
    } else {
      // Fallback, sollte niemals erreicht werden dank des assert()
      contentWidget = const SizedBox(); // Leeres Widget
    }

    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50, // Breite des runden Hintergrunds
            height: 50, // Höhe des runden Hintergrunds
            decoration: BoxDecoration(
              color: AppColors.primaryColor, // Blauer runder Hintergrund
              shape: BoxShape.circle, // Runde Form
              border: Border.all(
                color: AppColors
                    .secondaryColor, // Rahmenfarbe: Primärfarbe (hellblau)
                width: 2,
              ), // Rahmenfarbe und -stärke
            ),
            child: Center(
              child: contentWidget, // Zeigt entweder das Bild oder das Icon an
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.label,
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
