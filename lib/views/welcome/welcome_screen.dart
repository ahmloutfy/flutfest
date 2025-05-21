import 'package:flutfest/core/utils/snackbar_helper.dart';
import 'package:flutfest/widgets/backgrounds/intro_background.dart';
import 'package:flutfest/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroBackground(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth;
            double height = constraints.maxHeight;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // App Logo
                Center(
                  child: SvgPicture.asset(
                    'assets/images/flutfest_logo.svg',
                    width: width * 0.5,
                    // Set the width relative to screen size
                    height: height * 0.3,
                    // Set the height relative to screen size
                    fit:
                        BoxFit
                            .contain, // Ensure the logo fits within the allocated space
                  ),
                ),
                // Welcome Text
                Text(
                  'Welcome to FlutFest!',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize:
                        width * 0.08, // Font size relative to screen width
                  ),
                ),
                Gutter(),

                // Description Text
                Text(
                  'Manage and explore events seamlessly.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize:
                        width * 0.05, // Font size relative to screen width
                  ),
                ),
                Gutter(),

                // Login Button
                SizedBox(
                  width: width * 0.6,
                  child: PrimaryButton(
                    text: 'Login',
                    onPressed: () {
                      // Show Snack bar before navigating
                      showCustomSnackBar(context, 'Navigate to Login Screen');

                      // Transition to Login screen using GetX
                      // Get.toNamed('/login');
                    },
                  ),
                  // Button width relative to screen size
                ),
                Gutter(),

                // Register Button
                SizedBox(
                  width: width * 0.6, // Button width relative to screen size
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: BorderSide(color: Colors.white),
                    ),
                    child: const Text('Register'),
                    onPressed: () {
                      // Transition to Register screen using GetX
                      Get.toNamed('/register');
                      // Replace with the actual route for Register screen
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
