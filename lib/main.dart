import 'package:device_preview/device_preview.dart';
import 'package:flutfest/logic/controllers/settings_controller.dart';
import 'package:flutfest/routes.dart';
import 'package:flutfest/theme.dart';
import 'package:flutfest/views/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(DevicePreview(enabled: false, builder: (context) =>  FlutFest(),),);
}

class FlutFest extends StatelessWidget {
  final SettingsController controller = Get.put(SettingsController());

   FlutFest({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
      initialRoute: Routes.welcome,
      getPages: Routes.pages,
      debugShowCheckedModeBanner: false,
      title: 'FlutFest',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: controller.getThemeMode(),
      home: const WelcomeScreen(),
    ));
  }
}