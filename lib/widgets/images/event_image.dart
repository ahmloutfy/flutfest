import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutfest/logic/models/event_model.dart';

class EventImage extends StatelessWidget {
  const EventImage({super.key, required this.event, this.imageHeight});

  final EventModel event;
  final double? imageHeight;

  bool _isAssetImage(String? path) {
    return path != null && !path.startsWith('/');
  }

  @override
  Widget build(BuildContext context) {
    final imagePath = event.image;

    if (imagePath == null || imagePath.isEmpty) {
      return const SizedBox(
        height: 150,
        child: Center(child: Icon(Icons.image_not_supported)),
      );
    }

    if (_isAssetImage(imagePath)) {
      return Image.asset(
        imagePath,
        alignment: const Alignment(0, -0.3),
        height: imageHeight,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const SizedBox(
            height: 150,
            child: Center(child: Icon(Icons.broken_image)),
          );
        },
      );
    }

    final imageFile = File(imagePath);
    return Image.file(
      imageFile,
      alignment: const Alignment(0, -0.3),
      height: imageHeight,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return const SizedBox(
          height: 150,
          child: Center(child: Icon(Icons.broken_image)),
        );
      },
    );
  }
}