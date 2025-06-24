import 'package:flutfest/core/utils/snackbar_helper.dart';
import 'package:flutfest/logic/controllers/favorite_controller.dart';
import 'package:flutfest/views/details/event_details_screen.dart';
import 'package:flutfest/views/home/components/event_card.dart';
import 'package:flutfest/views/home/components/events_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/dummy_events.dart';
import '../../../logic/models/event_model.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({super.key});

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  String selectedTab = 'All';
  final FavoriteController favController = Get.put(FavoriteController());

  List<Event> get filteredEvents {
    final now = DateTime.now();

    return DummyEvents.events.where((event) {
      final eventDate = DateTime.tryParse(event.date!);
      if (eventDate == null) return false;

      switch (selectedTab) {
        case 'Upcoming':
          return eventDate.isAfter(now) || (event.isUpcomingForDemo == true);
        case 'Expired':
          return eventDate.isBefore(now) && (event.isUpcomingForDemo != true);
        case 'Favorites':
          return favController.favoriteEvents.containsKey(event.id) &&
              favController.favoriteEvents[event.id]!;
        default:
          return true;
      }
    }).toList();
  }

  void _navigateToEventDetails(Event event) {
    Get.to(() => EventDetailsScreen(event: event));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final isTablet = constraints.maxWidth > 600;
        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              child:
                  isTablet
                      ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: EventsCategories(
                          selectedTab: selectedTab,
                          onTabSelected: (tab) {
                            setState(() {
                              selectedTab = tab;
                            });
                            showCustomSnackBar(context, '$tab events');
                          },
                        ),
                      )
                      : EventsCategories(
                        selectedTab: selectedTab,
                        onTabSelected: (tab) {
                          setState(() {
                            selectedTab = tab;
                          });
                          showCustomSnackBar(context, '$tab events');
                        },
                      ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(const Duration(milliseconds: 500),);

                  setState(() {});
                },
                child: EventCard(
                  events: filteredEvents,
                  onEventTap: _navigateToEventDetails,
                ),
              ),
            ),

          ],
        );
      },
    );
  }
}
