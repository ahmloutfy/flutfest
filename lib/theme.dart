import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // 🎨 Primary Colors
  static const Color primarySeedColor = Color(0xFFF4A100);
  static const Color secondaryColor = Color(0xFF2D3E50);
  static const Color tertiaryColor = Color(0xFF27AE60);

  // ☀️ Light Mode Colors
  static const Color lightTextColor = Color(0xFF333333);
  static const Color lightButtonColor = Color(0xFFF4A100);
  static const Color lightBackground = Colors.white;
  static const Color eventCardBackgroundLight = Color(0xFFF9F9F9);
  static const Color eventRSVPButtonColorLight = Color(0xFF27AE60);
  static const Color importantEventColorLight = Color(0xFFD32F2F);
  static const Color confirmedEventColorLight = Color(0xFF388E3C);
  static const Color shadowColorLight = Color(0xFFB0BEC5);
  static const Color borderColorLight = Color(0xFF333333);
  static const Color lightInputFillColor = Color(0xFFF5F5F5);
  static const Color buttonTextColorLight = Colors.white;
  static const Color dividerColorLight = Color(0xFFBDBDBD);
  static const Color linkColorLight = Color(0xFF1E88E5);

  // 🌙 Dark Mode Colors
  static const Color darkTextColor = Color(0xFFE0E0E0);
  static const Color darkButtonColor = Color(0xFF1E88E5);
  static const Color darkBackground = Color(0xFF121212);
  static const Color eventCardBackgroundDark = Color(0xFF1E1E1E);
  static const Color eventRSVPButtonColorDark = Color(0xFF69F0AE);
  static const Color importantEventColorDark = Color(0xFFFFCDD2);
  static const Color confirmedEventColorDark = Color(0xFF81C784);
  static const Color shadowColorDark = Color(0xFF424242);
  static const Color borderColorDark = Color(0xFF616161);
  static const Color darkInputFillColor = Color(0xFF333333);
  static const Color buttonTextColorDark = Colors.white;
  static const Color dividerColorDark = Color(0xFF424242);
  static const Color darkLinkColor = Color(0xFF90CAF9);

  // 🎨 Method to get color based on current mode
  static Color getColorForTheme({
    required BuildContext context,
    required Color lightModeColor,
    required Color darkModeColor,
  }) {
    return isDarkMode(context) ? darkModeColor : lightModeColor;
  }

  // 🎨 Method to check if the current theme is Dark mode
  static bool isDarkMode(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }

  // 🎨 Base Color Scheme
  static final ColorScheme baseColorScheme = ColorScheme.fromSeed(
    seedColor: primarySeedColor,
    secondary: secondaryColor,
    tertiary: tertiaryColor,
  );

  // ☀️ Light Theme
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: baseColorScheme.copyWith(
      brightness: Brightness.light,
      onSurface: lightTextColor,
      surface: lightBackground,
    ),

    scaffoldBackgroundColor: lightBackground,
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.montserrat(
        fontSize: 32, fontWeight: FontWeight.bold, color: lightTextColor,
      ),
      headlineMedium: GoogleFonts.montserrat(
        fontSize: 24, fontWeight: FontWeight.w600, color: lightTextColor,
      ),
      headlineSmall: GoogleFonts.montserrat(
        fontSize: 20, fontWeight: FontWeight.w500, color: lightTextColor,
      ),
      bodyLarge: GoogleFonts.roboto(fontSize: 18, color: lightTextColor),
      bodyMedium: GoogleFonts.roboto(fontSize: 16, color: lightTextColor),
      bodySmall: GoogleFonts.roboto(fontSize: 14, color: Colors.grey),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: lightTextColor,
        side: BorderSide(color: borderColorLight),
        textStyle: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightButtonColor,
        foregroundColor: buttonTextColorLight,
        textStyle: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),
        shadowColor: shadowColorLight,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: lightTextColor),
      hintStyle: TextStyle(color: Colors.grey),
      filled: true,
      fillColor: lightInputFillColor,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: borderColorLight),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primarySeedColor, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: dividerColorLight,
      thickness: 1,
    ),
    cardTheme: CardTheme(
      color: eventCardBackgroundLight,
      shadowColor: shadowColorLight,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: borderColorLight),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: linkColorLight,
        textStyle: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    ),
  );

  // 🌙 Dark Theme
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: baseColorScheme.copyWith(
      brightness: Brightness.dark,
      onSurface: darkTextColor,
      surface: darkBackground,
    ),
    scaffoldBackgroundColor: darkBackground,
    textTheme: TextTheme(

      headlineLarge: GoogleFonts.montserrat(
        fontSize: 32, fontWeight: FontWeight.bold, color: darkTextColor,
      ),
      headlineMedium: GoogleFonts.montserrat(
        fontSize: 24, fontWeight: FontWeight.w600, color: darkTextColor,
      ),
      headlineSmall: GoogleFonts.montserrat(
        fontSize: 20, fontWeight: FontWeight.w500, color: darkTextColor,
      ),
      bodyLarge: GoogleFonts.roboto(fontSize: 18, color: darkTextColor),
      bodyMedium: GoogleFonts.roboto(fontSize: 16, color: darkTextColor),
      bodySmall: GoogleFonts.roboto(fontSize: 14, color: Colors.grey),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: darkTextColor,
        side: BorderSide(color: borderColorDark),
        textStyle: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkButtonColor,
        foregroundColor: buttonTextColorDark,
        textStyle: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadowColor: shadowColorDark,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: darkTextColor),
      hintStyle: TextStyle(color: Colors.grey),
      filled: true,
      fillColor: darkInputFillColor,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: borderColorDark),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primarySeedColor, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: dividerColorDark,
      thickness: 1,
    ),
    cardTheme: CardTheme(
      color: eventCardBackgroundDark,
      shadowColor: shadowColorDark,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: borderColorDark),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: darkLinkColor,
        textStyle: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    ),
  );
}