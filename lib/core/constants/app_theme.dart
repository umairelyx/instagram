import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.blue,

    // Disable ripple glow
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.textPrimary),
      titleTextStyle: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.blue,
    ),

    colorScheme: const ColorScheme.dark(
      primary: AppColors.blue,
      secondary: AppColors.blue,
      surface: AppColors.background,
    ),
  );
}
