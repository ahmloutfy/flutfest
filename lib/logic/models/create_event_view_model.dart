// 📁 create_event_viewmodel.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateEventViewModel extends GetxController {
  final titleController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();

  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  Rx<File?> pickedImage = Rx<File?>(null);

  void setDate(DateTime date) {
    selectedDate.value = date;
  }

  void resetForm() {
    titleController.clear();
    locationController.clear();
    descriptionController.clear();
    pickedImage.value = null;
    selectedDate.value = null;
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile =
    await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedImage.value = File(pickedFile.path);
    }
  }
}