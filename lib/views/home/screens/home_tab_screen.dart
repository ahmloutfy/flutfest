import 'package:flutfest/core/utils/snackbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutfest/views/home/components/event_card.dart';
import 'package:flutfest/views/home/components/events_categories.dart';

import '../../../core/utils/dummy_events.dart';
import '../../../logic/models/event_model.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({super.key});

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  String selectedTab = 'All';
  Map<int, bool> favoriteEvents = {};

  void toggleFavorite(int eventId) {
    setState(() {
      favoriteEvents[eventId] = !(favoriteEvents[eventId] ?? false);
    });
  }

  List<Event> get filteredEvents {
    final now = DateTime.now();

    return DummyEvents.events.where((event) {
      final eventDate = DateTime.tryParse(event.date!);
      if (eventDate == null) return false;

      switch (selectedTab) {
        case 'Upcoming':
          return eventDate.isAfter(now) || (event.isUpcomingForDemo == true);
        case 'Expired':
          return eventDate.isBefore(now) || (event.isUpcomingForDemo != true);
        case 'Favorites':
          return favoriteEvents[event.id] == true;
        default:
          return true;
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EventsCategories(
          selectedTab: selectedTab,
          onTabSelected: (tab) {
            setState(() {
              selectedTab = tab;
            });
            showCustomSnackBar(context, '$tab events');
          },
        ),
        EventCard(
          events: filteredEvents,
          eventsFavorite: favoriteEvents,
          onFavoriteToggle: toggleFavorite,
        ),
      ],
    );
  }
}