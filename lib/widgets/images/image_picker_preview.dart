import 'dart:io';
import 'package:flutter/material.dart';

class ImagePickerPreview extends StatelessWidget {
  final File? imageFile;

  const ImagePickerPreview({
    super.key,
    required this.imageFile,
  });

  @override
  Widget build(BuildContext context) {
    if (imageFile != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.file(
          imageFile!,
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
        ),
      );
    }

    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Text('No image selected'),
      ),
    );
  }
}