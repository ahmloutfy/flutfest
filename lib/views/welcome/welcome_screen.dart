import 'package:flutfest/routes.dart';
import 'package:flutfest/theme.dart';
import 'package:flutfest/widgets/backgrounds/intro_background.dart';
import 'package:flutfest/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color translucentBlue = AppTheme.getColorForTheme(
      context: context,
      lightModeColor: AppTheme.lightButtonColor.withValues(alpha: 0.2),
      darkModeColor: AppTheme.darkButtonColor.withValues(alpha: 0.2),
    );

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
                    height: height * 0.3,
                    fit: BoxFit.contain,
                  ),
                ),
                // Welcome Text
                Text(
                  'Welcome to FlutFest!',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: width * 0.08,
                  ),
                ),
                Gutter(),

                // Description Text
                Text(
                  'Manage and explore events seamlessly.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: width * 0.05,
                  ),
                ),
                Gutter(),

                // Login Button
                SizedBox(
                  width: width * 0.6,
                  child: PrimaryButton(
                    text: 'Login',
                    onPressed: () {
                      Get.toNamed(Routes.login);
                    },
                  ),
                ),
                Gutter(),

                // Register Button
                SizedBox(
                  width: width * 0.6,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: translucentBlue,
                      foregroundColor: Colors.white,
                      side: BorderSide(color: Colors.white.withValues(alpha: 0.6)),
                      elevation: 0,
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.register);

                    },
                    child: const Text('Register'),
                  ),
                ),
                Gutter(),

                // Temporary Preview Button for screen package navigation
                if (kDebugMode)
                  SizedBox(
                    width: width * 0.6,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: translucentBlue,
                        foregroundColor: Colors.white,
                        side: BorderSide(color: Colors.white.withValues(alpha: 0.6)),
                        elevation: 0,
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.home);
                      },
                      child: const Text('Explore UI Screens'),
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
