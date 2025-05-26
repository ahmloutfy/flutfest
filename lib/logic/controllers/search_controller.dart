import 'package:get/get.dart';
import '../../core/utils/dummy_events.dart';
import '../models/event_model.dart';

class SearchScreenController extends GetxController {
  var searchQuery = ''.obs;
  var searchResults = <Event>[].obs;

  void search(String query) {
    searchQuery.value = query;

    if (query.trim().isEmpty) {
      searchResults.clear();
      return;
    }

    searchResults.value = DummyEvents.events.where((event) {
      final lowerQuery = query.toLowerCase();
      return event.title!.toLowerCase().contains(lowerQuery) ||
          event.description!.toLowerCase().contains(lowerQuery);
    }).toList();
  }

  void clearSearch() {
    searchQuery.value = '';
    searchResults.clear();
  }
}