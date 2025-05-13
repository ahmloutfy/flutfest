import 'package:flutfest/core/utils/snackbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/buttons/primary_button.dart';
import '../../widgets/backgrounds/intro_background.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: IntroBackground(
          child: LayoutBuilder(
            builder: (context, constraints) {
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
                      'Create an Account',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const Gutter(),

                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        hintText: 'Enter your name',
                      ),
                    ),
                    const Gutter(),

                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                      ),
                    ),
                    const Gutter(),

                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Create a password',
                      ),
                    ),
                    const Gutter(),

                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        hintText: 'Re-enter your password',
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
                        text: 'Register',
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

                    SizedBox(
                      width: width * 0.8,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          showCustomSnackBar(context, 'Register with Google');
                        },
                        child: Row(
                          children: [
                            const Spacer(),
                            SvgPicture.asset(
                              'assets/icons/social_media/google-logo.svg',
                              height: 20,
                              width: 20,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            const Gutter(),
                            const Text('Register with Google'),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                    const Gutter(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed('/login');
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                  blurRadius: 2,
                                  color: Colors.black.withValues(alpha: 0.8),
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),                          ),
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
