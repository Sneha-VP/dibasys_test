import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFCE7A4C); // Orange-brown
  static const Color backgroundColor = Colors.black;
  static const Color textColor = Colors.white;

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: backgroundColor,
    primaryColor: primaryColor,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: textColor, fontSize: 16),
      titleLarge: TextStyle(color: primaryColor, fontSize: 24, fontWeight: FontWeight.bold),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 14),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
