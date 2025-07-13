import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutfest/core/utils/dummy_events.dart';
import 'package:flutfest/logic/controllers/favorite_controller.dart';
import 'package:flutfest/logic/models/event_model.dart';
import 'package:flutfest/views/accounts/account_screen.dart';
import 'package:flutfest/widgets/buttons/create_event_button.dart';
import 'package:flutfest/widgets/custom_appbar.dart';
import '../../events/screens/my_events_screen.dart';
import 'home_tab_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  String selectedTab = 'All';
  List<EventModel> displayedEvents = DummyEvents.events;
  late FavoriteController favController;

  @override
  void initState() {
    super.initState();
    favController = Get.put(FavoriteController());
  }

  void _filterEvents() {
    final now = DateTime.now();
    List<EventModel> allEvents = DummyEvents.events;

    setState(() {
      if (selectedTab == 'All') {
        displayedEvents = allEvents;
      } else if (selectedTab == 'Upcoming') {
        displayedEvents =
            allEvents.where((e) => DateTime.parse(e.date!).isAfter(now)).toList();
      } else if (selectedTab == 'Expired') {
        displayedEvents =
            allEvents.where((e) => DateTime.parse(e.date!).isBefore(now)).toList();
      } else if (selectedTab == 'Favorites') {
        displayedEvents = allEvents
            .where((e) => favController.favoriteEvents[e.id] == true)
            .toList();
      }
    });
  }

  void onTabSelected(String tab) {
    selectedTab = tab;
    _filterEvents();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeTabScreen(),
      const MyEventsScreen(),
      const AccountScreen(),
    ];

    return Scaffold(
      appBar: customAppBar(context, 'Welcome User'),
      floatingActionButton: _currentIndex == 0 || _currentIndex == 1
          ? CreateEventButton()
          : null,
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'My Events'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}