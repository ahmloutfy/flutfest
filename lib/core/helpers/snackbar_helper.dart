import 'package:flutfest/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBar(String message) {
  final BuildContext context = Get.context!;
  final messenger = ScaffoldMessenger.of(context);
  messenger.hideCurrentSnackBar();

  messenger.showSnackBar(
    SnackBar(
      backgroundColor: AppTheme.isDarkMode(context)
          ? AppTheme.lightBackgroundColor
          : AppTheme.darkBackgroundColor,
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppTheme.isDarkMode(context)
              ? AppTheme.darkBackgroundColor
              : AppTheme.lightBackgroundColor,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
