import 'package:flutter/material.dart';
import 'package:flutfest/theme.dart';

class PickDateHelper {
  static Future<DateTime?> show(BuildContext context) async {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            dialogTheme: DialogThemeData(
              backgroundColor:
              isDark ? AppTheme.darkBackgroundColor : AppTheme.lightBackgroundColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor:
                isDark ? Colors.lightBlueAccent : AppTheme.primarySeedColor,
              ),
            ),
            colorScheme: ColorScheme(
              brightness: isDark ? Brightness.dark : Brightness.light,
              primary: isDark ? Colors.lightBlueAccent : AppTheme.primarySeedColor,
              onPrimary: Colors.white,
              surface:
              isDark ? AppTheme.darkBackgroundColor : AppTheme.lightBackgroundColor,
              onSurface: isDark ? AppTheme.darkTextColor : AppTheme.lightTextColor,
              secondary: AppTheme.tertiaryColor,
              onSecondary: Colors.white,
              error: Colors.red,
              onError: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );
  }
}
