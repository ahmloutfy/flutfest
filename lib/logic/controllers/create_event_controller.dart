import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateEventController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();

  final selectedDate = Rxn<DateTime>();
  final pickedImage = Rxn<File>();

  void pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedImage.value = File(pickedFile.path);
    }
  }

  void pickDate(BuildContext context) async {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.lightBlueAccent,
              brightness: isDark ? Brightness.dark : Brightness.light,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) selectedDate.value = picked;
  }

  void submitForm(BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (pickedImage.value == null) {
        Get.snackbar('Missing Image', 'Please select an image.', snackPosition: SnackPosition.BOTTOM);
        return;
      }
      _showSuccessDialog(context);
    }
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Success'),
        content: const Text('Event created successfully!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: handle invite friends
            },
            child: const Text('Invite Friends'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Get.back();
              // TODO: go to event browser screen
            },
            child: const Text('Browse Events'),
          ),
        ],
      ),
    );
  }
}