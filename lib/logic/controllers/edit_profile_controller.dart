import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final nameController = TextEditingController(text: 'John Doe');
  final emailController = TextEditingController(text: 'johndoe@example.com');

  void saveChanges(BuildContext context) {
    // Here you can later add logic to save to local storage or API
    Get.back();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated')),
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}