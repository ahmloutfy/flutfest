import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'User Profile / Settings',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
