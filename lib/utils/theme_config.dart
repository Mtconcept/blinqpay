import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

class ThemeConfig {
  // Define light theme
  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    indicatorColor: const Color(0xfff7f7f7),
    fontFamily: GoogleFonts.libreFranklin().fontFamily,
    dividerColor: Colors.grey.withOpacity(0.4),
    canvasColor: Colors.black54,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 16,
          letterSpacing: -0.2),
      bodyMedium: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
          fontSize: 14,
          letterSpacing: -0.1),
      bodySmall: TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.1),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: primaryColor,
    ),
  );

  // Define dark theme
  static final ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    canvasColor: Colors.white70,
    dividerColor: const Color(0x0ff33333),
    indicatorColor: const Color(0xff403E3E),
    fontFamily: GoogleFonts.libreFranklin().fontFamily,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          letterSpacing: -0.2,
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16),
      bodyMedium: TextStyle(
          letterSpacing: -0.1,
          color: Colors.white,
          fontWeight: FontWeight.w300,
          fontSize: 14),
      bodySmall: TextStyle(
          letterSpacing: -0.1,
          color: Colors.white,
          fontWeight: FontWeight.w300,
          fontSize: 12),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: primaryColor,
    ),
  );
}
