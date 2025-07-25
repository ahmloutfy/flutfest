import 'package:flutfest/core/utils/snackbar_helper.dart';
import 'package:flutfest/logic/models/event_model.dart';
import 'package:flutfest/routes.dart';
import 'package:flutfest/widgets/buttons/add_to_calendar_button.dart';
import 'package:flutfest/widgets/buttons/booking_button.dart';
import 'package:flutfest/widgets/buttons/favorite_button.dart';
import 'package:flutfest/widgets/buttons/share_button.dart';
import 'package:flutfest/widgets/custom_appbar.dart';
import 'package:flutfest/widgets/images/event_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailsScreen extends StatefulWidget {
  final EventModel event;

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
      'EEEE, MMMM d, yyyy',
    ).format(DateTime.parse(widget.event.date!));

    return Scaffold(
      appBar: customAppBar(
        context,
        widget.event.title ?? 'Event details',
        textStyle: TextStyle(fontSize: 18),
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
                child: SizedBox(
                    width: double.infinity,
                    child: EventImage(event: widget.event, imageHeight: 300)),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BookingButton(
                  label: isBooked ? 'Cancel Booking' : 'Book Now',
                  icon: isBooked ? Icons.cancel : Icons.event_available,
                  backgroundColor:
                      isBooked ? Colors.red : theme.colorScheme.primary,
                  onPressed: () async {
                    if (!isBooked) {
                      final result = await Get.toNamed(
                        Routes.bookingConfirmation,
                        arguments: widget.event,
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
                      showCustomSnackBar(
                        'You cancelled your booking.',
                      );
                    }
                  },
                ),
                const SizedBox(height: 12),
                AddToCalendarButton(event: widget.event),
                const SizedBox(height: 12),
                FavoriteButton(widget: widget),
                const SizedBox(height: 12),
                ShareButton(widget: widget, formattedDate: formattedDate),
              ],
            ),
            Gutter(),
          ],
        ),
      ),
    );
  }
}
