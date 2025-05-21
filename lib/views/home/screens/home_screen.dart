import 'package:flutfest/core/utils/dummy_events.dart';
import 'package:flutfest/logic/controllers/favorite_controller.dart';
import 'package:flutfest/logic/models/event_model.dart';
import 'package:flutfest/views/accounts/account_screen.dart';
import 'package:flutfest/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../events/my_events_screen.dart';
import 'home_tab_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  String selectedTab = 'All';
  List<Event> displayedEvents = DummyEvents.events;
  FavoriteController favController = Get.put(FavoriteController());

  void _filterEvents() {
    final now = DateTime.now();
    List<Event> allEvents = DummyEvents.events;

    setState(() {
      if (selectedTab == 'All') {
        displayedEvents = allEvents;
      } else if (selectedTab == 'Upcoming') {
        displayedEvents =
            allEvents
                .where((e) => DateTime.parse(e.date!).isAfter(now))
                .toList();
      } else if (selectedTab == 'Expired') {
        displayedEvents =
            allEvents
                .where((e) => DateTime.parse(e.date!).isBefore(now))
                .toList();
      } else if (selectedTab == 'Favorites') {
        displayedEvents =
            allEvents
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
      HomeTabScreen(),
      const MyEventsScreen(),
      const AccountScreen(),
    ];

    return Scaffold(
      appBar: customAppBar(context , 'Welcome User'),

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
