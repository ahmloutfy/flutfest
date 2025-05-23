import 'package:flutfest/core/utils/snackbar_helper.dart';
import 'package:flutfest/theme.dart';
import 'package:flutfest/widgets/backgrounds/intro_background.dart';
import 'package:flutfest/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = AppTheme.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: IntroBackground(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final width = constraints.maxWidth;

              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.1,
                  vertical: width * 0.2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/flutfest_logo.svg',
                      width: width * 0.5,
                      fit: BoxFit.contain,
                    ),
                    const Gutter(),
                    Text(
                      'Login to FlutFest',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const Gutter(),
                    TextField(
                      decoration: InputDecoration(
                        floatingLabelStyle: TextStyle(
                          color: isDark ? Colors.white : Colors.black,
                        ),
                        labelText: 'Email',
                        hintText: 'Enter your email',
                      ),
                    ),
                    const Gutter(),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        floatingLabelStyle: TextStyle(
                          color: isDark ? Colors.white : Colors.black,
                        ),

                        labelText: 'Password',
                        hintText: 'Enter your password',
                      ),
                    ),
                    const Gutter(),
                    TextButton(
                      onPressed: () {
                        showCustomSnackBar(
                          context,
                          'Navigating to Forgot Password Screen',
                        );
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.lightBlueAccent),
                      ),
                    ),
                    const Gutter(),
                    SizedBox(
                      width: width * 0.8,
                      child: PrimaryButton(
                        onPressed: () {
                          showCustomSnackBar(
                            context,
                            'Navigating to Home Screen',
                          );
                        },
                        text: 'Login',
                      ),
                    ),
                    const Gutter(),
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'or',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        const Expanded(child: Divider()),
                      ],
                    ),
                    const Gutter(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: width * 0.8,
                          child: PrimaryButton(
                            icon: SvgPicture.asset(
                              'assets/icons/social_media/google-logo.svg',
                              height: 20,
                              width: 20,
                              colorFilter: ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            backgroundColor: Colors.blue,
                            text: 'Login with Google',
                            onPressed: () {
                              showCustomSnackBar(
                                context,
                                'Navigating to Google Login',
                              );
                            },
                          ),
                        ),
                        Gutter(),
                        SizedBox(
                          width: width * 0.8,
                          child: PrimaryButton(
                            textColor: isDark ? Colors.black : Colors.white,
                            icon: SvgPicture.asset(
                              'assets/icons/social_media/apple-logo.svg',
                              height: 20,
                              width: 20,
                              colorFilter: ColorFilter.mode(
                                isDark ? Colors.black : Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            backgroundColor:
                                isDark ? Colors.white : Colors.black,
                            text: 'Login with Apple',
                            onPressed: () {
                              showCustomSnackBar(
                                context,
                                'Navigating to Apple Login',
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const Gutter(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don’t have an account?',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed('/register');
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                  blurRadius: 2,
                                  color: Colors.black.withValues(alpha: 0.8),
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
