import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // 🎨 Primary Colors
  static const Color primarySeedColor = Color(0xFFF4A100);
  static const Color secondaryColor = Color(0xFF2D3E50);
  static const Color tertiaryColor = Color(0xFF27AE60);

  // 📂 Base Directory for Event Images
  static const String eventDirectory = 'assets/images/events/';

  // ☀️ Light Mode Colors
  static const Color lightTextColor = Color(0xFF333333);
  static const Color lightFieldTextColor = Color(0xFFF4A100);
  static const Color lightButtonColor = Color(0xFFF4A100);
  static const Color lightCursorColor = Color(0xFFF4A100);
  static const Color lightBackgroundColor = Colors.white;
  static const Color lightEventCardBackgroundColor = Color(0xFFF9F9F9);
  static const Color lightEventRSVPButtonColor = Color(0xFF27AE60);
  static const Color lightImportantEventColor = Color(0xFFD32F2F);
  static const Color lightConfirmedEventColor = Color(0xFF388E3C);
  static const Color lightShadowColor = Color(0xFFB0BEC5);
  static const Color lightBorderColor = Color(0xFFF4A100);
  static const Color lightInputFillColor = Color(0xFFF5F5F5);
  static const Color lightButtonTextColor = Colors.white;
  static const Color lightDividerColor = Color(0xFFBDBDBD);
  static const Color lightLinkColor = Color(0xFF1E88E5);
  static const Color lightPrefixIconColor = lightFieldTextColor;

  // 🌙 Dark Mode Colors
  static const Color darkTextColor = Color(0xFFE0E0E0);
  static const Color darkFieldTextColor = Color(0xFF1E88E5);

  static const Color darkButtonColor = Color(0xFF1E88E5);
  static const Color darkCursorColor = Color(0xFF1E88E5);
  static const Color darkBackgroundColor = Color(0xFF121212);
  static const Color darkEventCardBackgroundColor = Color(0xFF1E1E1E);
  static const Color darkEventRSVPButtonColor = Color(0xFF69F0AE);
  static const Color darkImportantEventColor = Color(0xFFFFCDD2);
  static const Color darkConfirmedEventColor = Color(0xFF81C784);
  static const Color darkShadowColor = Color(0xFF424242);
  static const Color darkBorderColor = Color(0xFF1E88E5);
  static const Color darkInputFillColor = Color(0xFF333333);
  static const Color darkButtonTextColor = Colors.white;
  static const Color darkDividerColor = Color(0xFF424242);
  static const Color darkLinkColor = Color(0xFF90CAF9);
  static const Color darkPrefixIconColor = darkFieldTextColor;

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
      primary: primarySeedColor,
      onPrimary: lightButtonTextColor,
      brightness: Brightness.light,
      onSurface: lightTextColor,
      surface: lightBackgroundColor,
    ),
    appBarTheme: AppBarTheme(color: lightBackgroundColor),
    scaffoldBackgroundColor: lightBackgroundColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: lightButtonColor,
      foregroundColor: lightButtonTextColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.montserrat(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: lightTextColor,
      ),
      headlineMedium: GoogleFonts.montserrat(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: lightTextColor,
      ),
      headlineSmall: GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: lightTextColor,
      ),
      bodyLarge: GoogleFonts.roboto(fontSize: 18, color: lightTextColor),
      bodyMedium: GoogleFonts.roboto(fontSize: 16, color: lightTextColor),
      bodySmall: GoogleFonts.roboto(fontSize: 14, color: Colors.grey),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: lightTextColor,
        side: BorderSide(color: lightBorderColor),
        textStyle: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightButtonColor,
        foregroundColor: lightButtonTextColor,
        textStyle: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadowColor: lightShadowColor,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: lightPrefixIconColor,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: lightBorderColor, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      labelStyle: TextStyle(color: lightFieldTextColor),
      hintStyle: TextStyle(color: lightFieldTextColor),
      filled: true,
      fillColor: lightInputFillColor,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: lightBorderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: lightBorderColor, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    dividerTheme: DividerThemeData(color: lightDividerColor, thickness: 1),
    cardTheme: CardThemeData(
      color: lightEventCardBackgroundColor,
      shadowColor: lightShadowColor,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: lightBorderColor),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: lightLinkColor,
        textStyle: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    tabBarTheme: TabBarThemeData(
      indicator: BoxDecoration(
        color: lightButtonColor, // Active tabular background color
        borderRadius: BorderRadius.circular(8),
      ),
      labelColor: lightButtonTextColor,
      // The active tabular text color
      unselectedLabelColor: lightTextColor.withValues(alpha: 0.6),
      // Inactive tab text color
      labelStyle: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      // Elevated Button
      unselectedLabelStyle: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: lightBackgroundColor,
      selectedItemColor: lightButtonColor,
      unselectedItemColor: lightTextColor.withValues(alpha: 0.6),
      selectedLabelStyle: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
    iconTheme: const IconThemeData(color: lightButtonColor, size: 24.0),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all<Color>(lightButtonColor),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.all(8.0),
        ),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return lightButtonColor;
        }
        return lightTextColor.withValues(alpha: 0.6);
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return lightButtonColor;
        }
        return lightTextColor.withValues(alpha: 0.6);
      }),
    ),
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return lightButtonColor.withValues(alpha: 0.5);
        }
        return lightTextColor.withValues(alpha: 0.3);
      }),
      thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return lightButtonColor;
        }
        return lightTextColor.withValues(alpha: 0.6);
      }),
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: lightCursorColor.withValues(alpha: 0.3),
      cursorColor: lightCursorColor,
      selectionHandleColor: lightCursorColor,
    ),
  );

  // 🌙 Dark Theme
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: baseColorScheme.copyWith(
      primary: darkButtonColor,
      onPrimary: darkButtonTextColor,
      brightness: Brightness.dark,
      onSurface: darkTextColor,
      surface: darkBackgroundColor,
    ),
    appBarTheme: AppBarTheme(color: darkBackgroundColor),
    scaffoldBackgroundColor: darkBackgroundColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: darkButtonColor,
      foregroundColor: darkButtonTextColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.montserrat(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: darkTextColor,
      ),
      headlineMedium: GoogleFonts.montserrat(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: darkTextColor,
      ),
      headlineSmall: GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: darkTextColor,
      ),
      bodyLarge: GoogleFonts.roboto(fontSize: 18, color: darkTextColor),
      bodyMedium: GoogleFonts.roboto(fontSize: 16, color: darkTextColor),
      bodySmall: GoogleFonts.roboto(fontSize: 14, color: Colors.grey),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: darkTextColor,
        side: BorderSide(color: darkBorderColor),
        textStyle: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkButtonColor,
        foregroundColor: darkButtonTextColor,
        textStyle: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadowColor: darkShadowColor,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: darkPrefixIconColor,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: darkBorderColor, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      labelStyle: TextStyle(color: darkFieldTextColor),
      hintStyle: TextStyle(color: darkFieldTextColor),
      filled: true,
      fillColor: darkInputFillColor,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: darkBorderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: darkBorderColor, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    dividerTheme: DividerThemeData(color: darkDividerColor, thickness: 1),
    cardTheme: CardThemeData(
      color: darkEventCardBackgroundColor,
      shadowColor: darkShadowColor,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: darkBorderColor),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: darkLinkColor,
        textStyle: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    tabBarTheme: TabBarThemeData(
      indicator: BoxDecoration(
        color: darkButtonColor, // Active tabular background color
        borderRadius: BorderRadius.circular(8), //  Elevated Button
      ),
      labelColor: darkButtonTextColor,
      // The active tabular text color
      unselectedLabelColor: darkTextColor.withValues(alpha: 0.6),
      // Inactive tab text color
      labelStyle: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkBackgroundColor,
      selectedItemColor: darkButtonColor,
      unselectedItemColor: darkTextColor.withValues(alpha: 0.6),
      selectedLabelStyle: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
    iconTheme: const IconThemeData(color: darkButtonColor, size: 24.0),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all<Color>(darkButtonColor),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.all(8.0),
        ),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return darkButtonColor;
        }
        return darkTextColor.withValues(alpha: 0.6);
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return darkButtonColor;
        }
        return darkTextColor.withValues(alpha: 0.6);
      }),
    ),
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return darkButtonColor.withValues(alpha: 0.5);
        }
        return darkTextColor.withValues(alpha: 0.3);
      }),
      thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return darkButtonColor;
        }
        return darkTextColor.withValues(alpha: 0.6);
      }),
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: darkCursorColor.withValues(alpha: 0.3),
      cursorColor: darkCursorColor,
      selectionHandleColor: darkCursorColor,
    ),
  );
}
