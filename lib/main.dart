import 'package:device_preview/device_preview.dart';
import 'package:flutfest/routes.dart';
import 'package:flutfest/theme.dart';
import 'package:flutfest/views/home/screens/home_screen.dart';
import 'package:flutfest/views/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


void main() {
  runApp(DevicePreview(
    enabled: false,

    builder: (context) => const FlutFest(),),);
}

class FlutFest extends StatelessWidget {
  const FlutFest({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.welcome,
      // Start the app on the Welcome Screen
      getPages: Routes.pages,
      // Define the pages using GetX routing
      debugShowCheckedModeBanner: false,
      title: 'FlutFest',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}
