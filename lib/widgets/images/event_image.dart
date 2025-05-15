import 'package:flutfest/logic/models/event_model.dart';
import 'package:flutter/material.dart';

class EventImage extends StatelessWidget {
  const EventImage({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: Image.asset(
        '${event.image}',
        fit: BoxFit.cover,
        height: 150,
        errorBuilder: (context, error, stackTrace) {
          return const SizedBox(
            height: 150,
            child: Center(child: Icon(Icons.image_not_supported)),
          );
        },
      ),
    );
  }
}