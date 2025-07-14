import 'package:flutfest/core/utils/snackbar_helper.dart';
import 'package:flutfest/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:get/get.dart';
import 'package:flutfest/logic/controllers/favorite_controller.dart';
import 'package:flutfest/logic/controllers/navigation_controller.dart';
import 'package:flutfest/logic/models/event_model.dart';
import 'package:flutfest/widgets/images/event_image.dart';
import 'package:flutfest/theme.dart';

class MyEventsScreen extends StatelessWidget {
  const MyEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteController = Get.find<FavoriteController>();
    final navigationController = Get.find<NavigationController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Events'),
        centerTitle: true,
      ),
      body: Obx(() {
        final favoriteEvents = favoriteController.favoriteEvents.entries
            .where((entry) => entry.value == true)
            .map((entry) => favoriteController.getEventById(entry.key))
            .where((event) => event != null)
            .cast<EventModel>()
            .toList();

        if (favoriteEvents.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.event_busy, size: 64, color: Colors.grey),
                const SizedBox(height: 16),
                Text(
                  'No events yet!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'Events you save will appear here.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        navigationController.goToHomeTab();
                      },
                      icon: const Icon(Icons.explore),
                      label: const Text('Explore Events'),
                    ),
                    Gutter(),
                    ElevatedButton.icon(
                      onPressed: () => Get.toNamed(Routes.createEvent),
                      icon: const Icon(Icons.add_circle_outline),
                      label: const Text('Create Event'),
                    ),
                  ],
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: () {
                    navigationController.goToHomeTab();
                  },
                  icon: const Icon(Icons.explore),
                  label: const Text('Explore Events'),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: favoriteEvents.length,
                itemBuilder: (context, index) {
                  final event = favoriteEvents[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: EventImage(event: event, imageHeight: 60),
                        ),
                      ),
                      title: Text(event.title ?? ''),
                      subtitle: Text(
                        '${event.location} • ${event.date}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppTheme.getColorForTheme(
                            context: context,
                            lightModeColor: Colors.grey,
                            darkModeColor: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.redAccent),
                        onPressed: () {
                          favoriteController.toggleFavorite(event.id);
                          showCustomSnackBar('Event removed from favorites');
                        },
                      ),
                      onTap: () {
                        Get.toNamed(Routes.eventDetails, arguments: event);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}