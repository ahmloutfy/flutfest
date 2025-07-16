import 'package:flutfest/core/helpers/snackbar_helper.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

enum ThemeOption { light, dark, system }

class SettingsController extends GetxController {
  ThemeMode getThemeMode() {
    switch (themeOption.value) {
      case ThemeOption.light:
        return ThemeMode.light;
      case ThemeOption.dark:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  var themeOption = ThemeOption.system.obs;

  // Notifications enabled or not
  var notificationsEnabled = false.obs;

  // Location access enabled or not
  var locationAccessEnabled = false.obs;

  void changeTheme(ThemeOption option) {
    themeOption.value = option;
    switch (option) {
      case ThemeOption.light:
        Get.changeThemeMode(ThemeMode.light);
        break;
      case ThemeOption.dark:
        Get.changeThemeMode(ThemeMode.dark);
        break;
      case ThemeOption.system:
        Get.changeThemeMode(ThemeMode.system);
        break;
    }
  }

  void toggleNotifications(bool value) {
    notificationsEnabled.value = value;

    showCustomSnackBar(
      value ? 'Notifications enabled' : 'Notifications disabled',
    );
  }

  void toggleLocationAccess(bool value) {
    locationAccessEnabled.value = value;

    showCustomSnackBar(
      value ? 'Location access allowed' : 'Location access denied',
    );
  }
}
