import 'package:flutfest/core/helpers/snackbar_helper.dart';
import 'package:flutfest/logic/controllers/favorite_controller.dart'; // استيراد الكنترولر
import 'package:flutfest/logic/models/event_model.dart';
import 'package:flutfest/theme.dart';
import 'package:flutfest/widgets/buttons/primary_button.dart';
import 'package:flutfest/widgets/images/event_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; //

class EventCard extends StatelessWidget {
  final List<EventModel>? events;
  final void Function(EventModel)? onEventTap;

  const EventCard({super.key, required this.events, this.onEventTap});

  @override
  Widget build(BuildContext context) {
    final FavoriteController favoriteController = Get.find();

    return ListView.builder(
      itemCount: events!.length,
      itemBuilder: (context, index) {
        final EventModel event = events![index];
        favoriteController.isFavorite(event.id);
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
          child: InkWell(
            onTap: () {
              onEventTap!(event);
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: 'event-${event.id}',
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: EventImage(event: event, imageHeight: 150),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${event.title}',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: AppTheme.getColorForTheme(
                                      context: context,
                                      lightModeColor: AppTheme.lightTextColor,
                                      darkModeColor: AppTheme.darkTextColor,
                                    ),
                                  ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Date: ${event.date}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Location: ${event.location}',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(
                                color: AppTheme.getColorForTheme(
                                  context: context,
                                  lightModeColor: AppTheme.lightLinkColor,
                                  darkModeColor: AppTheme.darkLinkColor,
                                ),
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${event.description}',
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            PrimaryButton(
                              text: 'Join',
                              onPressed: () {
                                showCustomSnackBar('Join event');
                              },
                            ),
                            Obx(
                              () => IconButton(
                                icon: Icon(
                                  color: favoriteController.favoriteEvents
                                              .containsKey(event.id) &&
                                          favoriteController
                                              .favoriteEvents[event.id]!
                                      ? Colors.red
                                      : Colors.grey,
                                  favoriteController.favoriteEvents.containsKey(
                                            event.id,
                                          ) &&
                                          favoriteController
                                              .favoriteEvents[event.id]!
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  size: 30,
                                ),
                                onPressed: () {
                                  favoriteController.toggleFavorite(event.id);
                                  showCustomSnackBar(
                                    favoriteController.favoriteEvents
                                                .containsKey(event.id) &&
                                            favoriteController
                                                .favoriteEvents[event.id]!
                                        ? 'Added to favorites'
                                        : 'Removed from favorites',
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
