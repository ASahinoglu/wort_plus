import 'package:flutter/material.dart';
import 'package:wort_plus/src/theme/app_colors.dart'; // Für die Farbdefinitionen

class ProgressIndicatorCard extends StatefulWidget {
  final String
  title; // Der Titel der Fortschrittsanzeige (z.B. "Quiz Progress", "Daily Goal")
  final double
  progressValue; // Der Fortschrittswert von 0.0 bis 1.0 (z.B. 0.87 für 87%)
  final Color
  progressColor; // Die Farbe des Fortschrittsbalkens (z.B. Primärfarbe oder Erfolgsfarbe)

  const ProgressIndicatorCard({
    super.key,
    required this.title,
    required this.progressValue,
    required this.progressColor,
  });

  @override
  State<ProgressIndicatorCard> createState() => _ProgressIndicatorCardState();
}

class _ProgressIndicatorCardState extends State<ProgressIndicatorCard> {
  @override
  Widget build(BuildContext context) {
    // Fortschrittsprozentsatz berechnen (auf null Dezimalstellen runden)
    String percentage = (widget.progressValue * 100).toStringAsFixed(0);

    return Container(
      padding: const EdgeInsets.all(
        12,
      ), // Innenabstand für den Inhalt der Karte
      decoration: BoxDecoration(
        color: AppColors
            .backgroundColor, // Hintergrundfarbe der Karte (gleiche wie App-Hintergrund)
        borderRadius: BorderRadius.circular(12), // Abgerundete Ecken
        border: Border.all(
          color:
              AppColors.secondaryColor, // Rahmenfarbe: Primärfarbe (hellblau)
          width: 2, // Rahmenstärke
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Elemente linksbündig ausrichten
        children: [
          Row(
            // NEU: Row für Titel und Prozentwert
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // Inhalte auf beiden Seiten verteilen
            children: [
              Text(
                widget.title, // Titel anzeigen
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(color: AppColors.textColor),
              ),
              Text(
                '$percentage%', // Angezeigter Prozentsatz
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(color: AppColors.textColor),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ), // Abstand zwischen Überschrift/Prozent und Fortschrittsbalken
          LinearProgressIndicator(
            value: widget.progressValue, // Fortschrittswert
            backgroundColor: AppColors.disabledPassive,
            // Hintergrundfarbe des Balkens
            valueColor: AlwaysStoppedAnimation<Color>(
              widget.progressColor,
            ), // Farbe des Fortschritts
            minHeight: 10, // Höhe des Balkens
            borderRadius: BorderRadius.circular(5), // Abgerundete Ecken
          ),
          // const SizedBox(height: 8), // Dieser Abstand und Align sind nicht mehr nötig
          // Align(
          //   alignment: Alignment.centerRight,
          //   child: Text(
          //     '$percentage%',
          //     style: Theme.of(
          //       context,
          //     ).textTheme.bodySmall?.copyWith(color: AppColors.disabledPassive),
          //   ),
          // ),
        ],
      ),
    );
  }
}
