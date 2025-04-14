import 'package:flutfest/theme.dart';
import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppTheme.isDarkMode(context)
          ? AppTheme.lightBackground// Dark background color in dark mode
          : AppTheme.darkBackground, // Light background color in light mode
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppTheme.isDarkMode(context)
              ? AppTheme.darkBackground // Dark text color in dark mode
              : AppTheme.lightBackground, // Light text color in light mode
        ),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // You can customize the border shape
      ),
    ),
  );
}