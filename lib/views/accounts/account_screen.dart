import 'package:flutfest/views/edit_profile/edit_profile_screen.dart';
import 'package:flutfest/views/help_support/help_suppport_screen.dart';
import 'package:flutfest/views/settings/settings_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/user.png'),
                ),
                const SizedBox(height: 12),
                Text(
                  'John Doe',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  'johndoe@example.com',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: () {
                    Get.to(() => EditProfileScreen(),);
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text('Edit Profile'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Get.to(() =>  SettingsScreen(),);
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Help & Support'),
            onTap: () {
              Get.to(() =>  HelpSupportScreen(),);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text('Log Out'),
            onTap: () {
              Get.defaultDialog(
                title: 'Confirm Logout',
                middleText: 'Are you sure you want to log out?',
                textCancel: 'Cancel',
                textConfirm: 'Log Out',
                confirmTextColor: Colors.white,
                onConfirm: () {
                  Get.back();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}