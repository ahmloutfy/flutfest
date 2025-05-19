import 'package:flutter/material.dart';
import 'package:flutfest/logic/models/event_model.dart';
import 'package:get/get.dart';

class BookingConfirmationScreen extends StatelessWidget {
  final Event event;

  const BookingConfirmationScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Confirmed'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(result: true);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 80),
              const SizedBox(height: 20),
              Text(
                'You have successfully booked:',
                style: theme.textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                event.title ?? '',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.back(result: true);
                },
                child: const Text('Back to Event'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
