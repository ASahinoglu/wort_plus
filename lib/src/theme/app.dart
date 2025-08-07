import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryColor,
        secondary: AppColors.secondaryColor,
        surface: AppColors.backgroundColor,
        onSurface: AppColors.textColor,
        error: AppColors.errorColor,
      ),
      scaffoldBackgroundColor: AppColors.backgroundColor,
      textTheme: const TextTheme(
        //H1
        displayLarge: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          fontSize: 32,
          color: AppColors.textColor,
        ),
        //H2
        headlineMedium: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: 24,
          color: AppColors.textColor,
        ),
        //H3
        headlineSmall: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: AppColors.textColor,
        ),
        //Body
        bodyLarge: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: AppColors.textColor,
        ),
        //Sekundär
        bodySmall: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w300,
          fontSize: 14,
          color: AppColors.textColor,
        ),
        //Button Text
        labelLarge: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: AppColors.textColor,
        ),
        //Nav Label
        labelMedium: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: AppColors.textColor,
        ),
        labelSmall: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: AppColors.textColor,
        ),
      ),

      //Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.textColor,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),

      //Bottom Nav
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.primaryColor,
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData?>((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.textColor);
          }
          return const IconThemeData(color: AppColors.backgroundColor);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>((states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(
              color: AppColors.textColor,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 14,
            );
          }
          return const TextStyle(
            color: AppColors.backgroundColor,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 14,
          );
        }),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        elevation: 0,
      ),
    );
  }
}
