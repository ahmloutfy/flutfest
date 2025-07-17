// 📁 create_event_viewmodel.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateEventViewModel extends GetxController {
  final titleController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();

  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  Rx<File?> pickedImage = Rx<File?>(null);

  RxString pickedLocationText = ''.obs;

  void setDate(DateTime date) {
    selectedDate.value = date;
  }

  void setLocation(String location) {
    locationController.text = location;
    pickedLocationText.value = location;
  }

  void getAddressFromLatLng(double lat, double lng) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
    if (placemarks.isNotEmpty) {
      final placemark = placemarks.first;
      final address =
          '${placemark.name}, ${placemark.locality}, ${placemark.country}';
      setLocation(address);
    } else {
      setLocation('$lat, $lng');
    }
  }


  void resetForm() {
    titleController.clear();
    locationController.clear();
    descriptionController.clear();
    pickedImage.value = null;
    selectedDate.value = null;
    pickedLocationText.value = '';
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
