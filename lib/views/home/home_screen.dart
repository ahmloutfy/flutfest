import 'package:flutfest/core/utils/dummy_events.dart';
import 'package:flutfest/core/utils/snackbar_helper.dart';
import 'package:flutfest/logic/models/event_model.dart';
import 'package:flutfest/views/home/components/event_card.dart';
import 'package:flutfest/views/home/components/events_categories.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<Event> displayedEvents = DummyEvents.events;
  // DateTime eventDate = DateTime.parse(event.date);

  Map<int, bool> favoriteEvents = {};

  void toggleFavorite(int eventId) {
    setState(() {
      favoriteEvents[eventId] = !(favoriteEvents[eventId] ?? false);
    });
  }

  // void _filterEvents(String category) {
  //   if (category == 'All') {
  //     displayedEvents = DummyEvents.events;
  //   } else if (category == 'Upcoming') {
  //     displayedEvents = DummyEvents.events.where((event) => event.date?.isAfter(DateTime.now())).toList();
  //   } else if (category == 'Expired') {
  //     displayedEvents = DummyEvents.events.where((event) => event.date?.isBefore(DateTime.now())).toList();
  //   } else if (category == 'Favorites') {
  //     displayedEvents = DummyEvents.events.where((event) => isFavorite(event)).toList();
  //   }
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Welcome {User Name}',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showCustomSnackBar(context, 'Search an event');
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              showCustomSnackBar(context, 'User Profile');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Event Categories
          EventsCategories(),
          // Event List
          EventCard(events: displayedEvents, eventsFavorite: favoriteEvents, onFavoriteToggle: toggleFavorite,),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }


}




