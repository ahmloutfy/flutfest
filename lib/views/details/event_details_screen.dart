import 'package:flutfest/core/utils/snackbar_helper.dart';
import 'package:flutfest/logic/controllers/favorite_controller.dart';
import 'package:flutfest/logic/models/event_model.dart';
import 'package:flutfest/widgets/buttons/add_to_calendar_button.dart';
import 'package:flutfest/widgets/buttons/booking_button.dart';
import 'package:flutfest/widgets/images/event_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../booking/booking_confirmation_screen.dart';

class EventDetailsScreen extends StatefulWidget {
  final Event event;

  const EventDetailsScreen({super.key, required this.event});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  bool isBooked = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final formattedDate = DateFormat(
      'EEEE, MMMM d, yyyy h:mm a',
    ).format(DateTime.parse(widget.event.date!));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.event.title ?? 'Event details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'event-${widget.event.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: EventImage(event: widget.event, imageHeight: 300,),
              ),
            ),
            Gutter(),
            Text(
              widget.event.title!,
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
                    try {
                      final url =
                          'https://maps.google.com/?q=${Uri.encodeComponent(widget.event.location!)}';
                      await launchUrl(
                        Uri.parse(url),
                        mode: LaunchMode.externalApplication,
                      );
                    } catch (e) {
                      Get.snackbar(
                        'Error',
                        'Could not open map: $e',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  },
                  child: Image.network(
                    'https://maps.googleapis.com/maps/api/staticmap?center=${Uri.encodeComponent(widget.event.location!)}&zoom=13&size=300x150&markers=${Uri.encodeComponent(widget.event.location!)}&key=AIzaSyAqDvJa0q_XJIT5HE7PR7CC4m_jtaq7a1E',
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
            Text(widget.event.description!, style: theme.textTheme.bodyMedium),
            Gutter(),
            Row(
              children: [
                Expanded(
                  child: BookingButton(
                    label: isBooked ? 'Cancel Booking' : 'Book Now',
                    icon: isBooked ? Icons.cancel : Icons.event_available,
                    backgroundColor:
                    isBooked ? Colors.red : theme.colorScheme.primary,
                    onPressed: () async {
                      if (!isBooked) {
                        final result = await Get.to(
                              () => BookingConfirmationScreen(event: widget.event),
                        );

                        if (result == true) {
                          setState(() {
                            isBooked = true;
                          });
                        }
                      } else {
                        setState(() {
                          isBooked = false;
                        });
                        showCustomSnackBar(context, 'You cancelled your booking.');
                      }
                    },
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: AddToCalendarButton(event: widget.event),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.find<FavoriteController>().toggleFavorite(widget.event.id);
                    },
                    child: GetBuilder<FavoriteController>(
                      init: FavoriteController(),
                      builder: (favController) {
                        return Icon(
                          favController.isFavorite(widget.event.id)
                              ? Icons.favorite
                              : Icons.favorite_border,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      SharePlus.instance.share(
                        ShareParams(
                          text:
                          'Check out this event: ${widget.event.title} - ${widget.event.location} on $formattedDate',
                        ),
                      );
                    },
                    child: const Icon(Icons.share),
                  ),
                ),
              ],
            ),
            Gutter(),
          ],
        ),
      ),
    );
  }
}