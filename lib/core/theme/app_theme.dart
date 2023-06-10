import 'package:flutter/material.dart';

abstract class AppTheme {
  static final lightTheme = ThemeData(
    fontFamily: 'Poppins',
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.w500,
        fontSize: 24
      ),
      iconTheme: IconThemeData(
        color: Color(0xFFFFFFFF),
      )
    ),
    textTheme: const TextTheme(

      displayLarge: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 22,
      ),
      displayMedium: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
      ),
      displaySmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 13,
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 15,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF6200EE),
      onPrimary: Color(0xFF3700B3),
      secondary: Color(0xFF03DAC5),
      onSecondary: Color(0xFF00AE97),
      tertiary: Color(0xFFE0E4EB),
      onTertiary: Color(0xFFE0E4EB),
      secondaryContainer: Color(0xFF00AE97),
      error: Color(0xFFFF5349),
      onError: Color(0xFFFF5349),
      background: Color(0xFFFFFFFF),
      onBackground: Color(0xFFFFFFFF),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFFFFFFFF),
      inversePrimary: Color(0xFFC4C4C4),

  ),
  );
}
