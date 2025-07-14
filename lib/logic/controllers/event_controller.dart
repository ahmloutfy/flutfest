// 📁 lib/logic/controllers/event_controller.dart

import 'package:get/get.dart';
import 'package:flutfest/logic/models/event_model.dart';
import 'package:flutfest/core/utils/dummy_events.dart';

class EventController extends GetxController {
  final events = <EventModel>[...DummyEvents.events].obs;

  void addEvent(EventModel event) {
    events.insert(0, event);
  }

  void clearEvents() {
    events.clear();
  }

  void resetToDummy() {
    events.assignAll(DummyEvents.events);
  }

  List<EventModel> getUpcomingEvents() {
    final now = DateTime.now();
    return events
        .where((e) => DateTime.tryParse(e.date ?? '')?.isAfter(now) ?? false)
        .toList();
  }

  List<EventModel> getExpiredEvents() {
    final now = DateTime.now();
    return events
        .where((e) => DateTime.tryParse(e.date ?? '')?.isBefore(now) ?? false)
        .toList();
  }
}