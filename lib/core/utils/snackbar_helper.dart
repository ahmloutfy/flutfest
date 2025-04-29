import 'package:flutfest/theme.dart';
import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String message) {

  final messenger = ScaffoldMessenger.of(context);
  messenger.hideCurrentSnackBar();

  messenger.showSnackBar(
    SnackBar(
      backgroundColor: AppTheme.isDarkMode(context)
          ? AppTheme.lightBackgroundColor// Dark background color in dark mode
          : AppTheme.darkBackgroundColor, // Light background color in light mode
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppTheme.isDarkMode(context)
              ? AppTheme.darkBackgroundColor // Dark text color in dark mode
              : AppTheme.lightBackgroundColor, // Light text color in light mode
        ),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // You can customize the border shape
      ),
    ),
  );
}