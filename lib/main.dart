import 'package:flutter/material.dart';
import 'package:wort_plus/utils/app_colors.dart'; // Pfad zur app_colors.dart Datei
import 'package:wort_plus/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WortPlus', // Der Titel der Anwendung
      theme: ThemeData(
        // Allgemeine Farbschema-Einstellungen
        primaryColor: AppColors.primaryColor, // Die primäre
        colorScheme: const ColorScheme.dark(
          // dunkles Farbschema
          primary: AppColors.primaryColor,
          secondary: AppColors.secondaryColor,
          surface: AppColors
              .backgroundColor, // Hintergrundfarbe (ersetzt 'background')
          onSurface: AppColors
              .textColor, // Textfarbe auf dem Hintergrund (ersetzt 'onBackground')
          error: AppColors.errorColor, // Farbe für Fehlermeldungen
          // 'success' und 'info' sind keine Standardparameter von ColorScheme.dark.
          // Diese Farben können direkt aus AppColors verwendet werden, wo sie benötigt werden.
        ),
        scaffoldBackgroundColor: AppColors
            .backgroundColor, // Standard-Hintergrundfarbe für Bildschirme
        // Typografie-Einstellungen (Textstile)
        textTheme: const TextTheme(
          // H1 - App-Titel
          displayLarge: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700, // Bold
            fontSize: 32,
            color: AppColors.textColor,
          ),
          // H2 - Bereichstitel
          headlineMedium: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600, // SemiBold
            fontSize: 24,
            color: AppColors.textColor,
          ),
          // H3 - Abschnittstitel
          headlineSmall: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500, // Medium
            fontSize: 20,
            color: AppColors.textColor,
          ),
          // Body Text (normaler Text)
          bodyLarge: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400, // Regular
            fontSize: 16,
            color: AppColors.textColor,
          ),
          // Sekundärtext (kleinerer oder weniger wichtiger Text)
          bodySmall: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300, // Light
            fontSize: 14,
            color: AppColors.textColor,
          ),
          // Button-Text
          labelLarge: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600, // SemiBold
            fontSize: 16,
            color: AppColors.textColor,
          ),
          // Navigation Label (Text in der BottomNavigationBar)
          labelMedium: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500, // Medium
            fontSize: 14,
            color: AppColors.textColor,
          ),
          labelSmall: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500, // Medium
            fontSize: 12,
            color: AppColors.textColor,
          ),
        ),

        // Thema für erhöhte Buttons (ElevatedButton)
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                AppColors.primaryColor, // Hintergrundfarbe des Buttons
            foregroundColor: AppColors.textColor, // Textfarbe des Buttons
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ), // Innenabstand des Buttons
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                8.0,
              ), // Abgerundete Ecken des Buttons
            ),
            textStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),

        // Thema für die untere Navigationsleiste (BottomNavigationBar)
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor:
              AppColors.primaryColor, // Hintergrundfarbe der Navigationsleiste
          selectedItemColor:
              AppColors.textColor, // Farbe des ausgewählten Elements
          unselectedItemColor: AppColors
              .backgroundColor, // Farbe der nicht ausgewählten Elemente
          type: BottomNavigationBarType
              .fixed, // Elemente bleiben fest und dehnen sich nicht aus
          showUnselectedLabels:
              true, // Beschriftungen für nicht ausgewählte Elemente anzeigen
        ),
      ),
      home: const MainScreen(), // Startbildschirm
    );
  }
}
