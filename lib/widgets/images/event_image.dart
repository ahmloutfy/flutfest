import 'package:flutfest/logic/models/event_model.dart';
import 'package:flutter/material.dart';

class EventImage extends StatelessWidget {
  const EventImage({super.key, required this.event, this.imageHeight});

  final EventModel event;
  final double? imageHeight;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      alignment: Alignment(0, -0.3),
      '${event.image}',
      fit: BoxFit.cover,
      height: imageHeight,
      errorBuilder: (context, error, stackTrace) {
        return const SizedBox(
          height: 150,
          child: Center(child: Icon(Icons.image_not_supported)),
        );
      },
    );
  }
}
