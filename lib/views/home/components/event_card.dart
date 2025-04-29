import 'package:flutfest/core/utils/dummy_events.dart';
import 'package:flutfest/core/utils/snackbar_helper.dart';
import 'package:flutfest/logic/models/event_model.dart';
import 'package:flutfest/theme.dart';
import 'package:flutfest/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';

class EventCard extends StatefulWidget {

  final List<Event>? events;
  final Map<int, bool>? eventsFavorite;
  final void Function(int)? onFavoriteToggle;

  const EventCard({super.key, required this.events, this.eventsFavorite, this.onFavoriteToggle});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.events!.length,
        itemBuilder: (context, index) {
          final Event event = widget.events![index];
          final bool isFavorite = widget.eventsFavorite?[event.id] == true;
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.asset('${event.image}', fit: BoxFit.cover),
                  ),
                  ListTile(
                    title: Text(
                      '${event.title}',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppTheme.primarySeedColor,
                      ),
                    ),
                    trailing: Column(
                      children: [
                        Text(
                          'Date: ${event.date}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${event.description}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
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
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      PrimaryButton(
                        text: 'Join',
                        onPressed: () {
                          showCustomSnackBar(context, 'Join event');
                        },
                      ),
                      IconButton(
                        color:  isFavorite ? Colors.red :Colors.grey ,
                        icon:
                        isFavorite
                                ? Icon(Icons.favorite, size: 30)
                                : Icon(Icons.favorite_border, size: 30),
                        onPressed: () {
                          widget.onFavoriteToggle!(event.id);
                          bool isNowFavorite = widget.eventsFavorite![event.id]!;
                          showCustomSnackBar(
                            context,
                            isNowFavorite
                                ? 'Added to favorites'
                                : 'Removed from favorites',
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
