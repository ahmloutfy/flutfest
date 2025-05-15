import 'package:flutfest/logic/controllers/favorite_controller.dart';
import 'package:flutfest/logic/models/event_model.dart';
import 'package:flutfest/widgets/images/event_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event;

  const EventDetailsScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    FavoriteController favController = Get.put(FavoriteController(),);
    final theme = Theme.of(context);
    final formattedDate = DateFormat(
      'EEEE, MMMM d, yyyy h:mm a',
    ).format(DateTime.parse(event.date!),);

    return Scaffold(
      appBar: AppBar(
        title: Text(event.title ?? 'Event details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {

              SharePlus.instance.share(
                  ShareParams(text: 'Check out this event: ${event.title} - ${event.location} on $formattedDate')
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              favController.toggleFavorite(event.id);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'event-${event.id}', // Unique tag for Hero animation
              child: EventImage(event: event,),
            ),
            Gutter(),
            Text(
              event.title!,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Gutter(),
            Row(
              children: [
                const Icon(Icons.calendar_today, color: Colors.grey),
                Gutter(),
                Text(formattedDate, style: theme.textTheme.bodyMedium),
              ],
            ),
            Gutter(),
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.grey),
                Gutter(),
                InkWell(
                  onTap: () async {
                    final url =
                        'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(event.location!)}';
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                    } else {
                      Get.snackbar(
                        'Error',
                        'Could not open map.',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  },
                  child: Text(
                    event.location!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            Gutter(),
            Text(
              'Description',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Gutter(),
            Text(event.description!, style: theme.textTheme.bodyMedium),
            Gutter(),
          ],
        ),
      ),
    );
  }
}
