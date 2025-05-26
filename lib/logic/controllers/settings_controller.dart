import 'package:get/get.dart';
import 'package:flutter/material.dart';

enum ThemeOption { light, dark, system }

class SettingsController extends GetxController {
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
  }

  void toggleLocationAccess(bool value) {
    locationAccessEnabled.value = value;
  }
}
