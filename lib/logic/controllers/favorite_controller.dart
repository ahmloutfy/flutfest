import 'package:get/get.dart';

class FavoriteController extends GetxController {
  final RxMap<int, bool> _favoriteEvents = <int, bool>{}.obs;

  Map<int, bool> get favoriteEvents => _favoriteEvents;

  bool toggleFavorite(int eventId) {
    final currentStatus = _favoriteEvents[eventId] ?? false;
    final newStatus = !currentStatus;
    _favoriteEvents[eventId] = newStatus;
    update();
    return newStatus;
  }

  bool isFavorite(int eventId) {
    return _favoriteEvents.containsKey(eventId) && _favoriteEvents[eventId]!;
  }
}
