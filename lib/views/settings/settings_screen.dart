import 'package:flutfest/logic/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final SettingsController controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          return ListView(
            children: [
              const Text(
                'Theme',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              RadioListTile<ThemeOption>(
                title: const Text('Light'),
                value: ThemeOption.light,
                groupValue: controller.themeOption.value,
                onChanged: (val) {
                  if (val != null) controller.changeTheme(val);
                },
              ),
              RadioListTile<ThemeOption>(
                title: const Text('Dark'),
                value: ThemeOption.dark,
                groupValue: controller.themeOption.value,
                onChanged: (val) {
                  if (val != null) controller.changeTheme(val);
                },
              ),
              RadioListTile<ThemeOption>(
                title: const Text('System Default'),
                value: ThemeOption.system,
                groupValue: controller.themeOption.value,
                onChanged: (val) {
                  if (val != null) controller.changeTheme(val);
                },
              ),
              const Divider(height: 32),
              SwitchListTile(
                title: const Text('Enable Notifications'),
                value: controller.notificationsEnabled.value,
                onChanged: (val) => controller.toggleNotifications(val),
              ),
              SwitchListTile(
                title: const Text('Allow Location Access'),
                value: controller.locationAccessEnabled.value,
                onChanged: (val) => controller.toggleLocationAccess(val),
              ),
            ],
          );
        }),
      ),
    );
  }
}
