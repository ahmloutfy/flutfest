import 'package:flutfest/core/utils/snackbar_helper.dart';
import 'package:flutfest/logic/controllers/event_controller.dart';
import 'package:flutfest/logic/controllers/favorite_controller.dart';
import 'package:flutfest/routes.dart';
import 'package:flutfest/views/home/components/event_card.dart';
import 'package:flutfest/views/home/components/events_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../logic/models/event_model.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({super.key});

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  String selectedTab = 'All';
  final FavoriteController favController = Get.put(FavoriteController());
  final EventController eventController = Get.find<EventController>();

  List<EventModel> getFilteredEvents() {
    final now = DateTime.now();
    return eventController.events.where((event) {
      final eventDate = DateTime.tryParse(event.date ?? '');
      if (eventDate == null) return false;

      switch (selectedTab) {
        case 'Upcoming':
          return eventDate.isAfter(now) || event.isUpcomingForDemo;
        case 'Expired':
          return eventDate.isBefore(now) && !event.isUpcomingForDemo;
        case 'Favorites':
          return favController.favoriteEvents[event.id] == true;
        default:
          return true;
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth > 600;
        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: isTablet
                  ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: EventsCategories(
                  selectedTab: selectedTab,
                  onTabSelected: (tab) {
                    setState(() {
                      selectedTab = tab;
                    });
                    showCustomSnackBar('$tab events');
                  },
                ),
              )
                  : EventsCategories(
                selectedTab: selectedTab,
                onTabSelected: (tab) {
                  setState(() {
                    selectedTab = tab;
                  });
                  showCustomSnackBar('$tab events');
                },
              ),
            ),
            Expanded(
              child: Obx(() => RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(const Duration(milliseconds: 300));
                },
                child: EventCard(
                  events: getFilteredEvents(),
                  onEventTap: _navigateToEventDetails,
                ),
              )),
            ),
          ],
        );
      },
    );
  }

  void _navigateToEventDetails(EventModel event) {
    Get.toNamed(Routes.eventDetails, arguments: event);
  }
}
