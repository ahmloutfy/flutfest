import 'package:get/get.dart';

class FavoriteController extends GetxController {
  final RxMap<int, bool> _favoriteEvents = <int, bool>{}.obs;

  Map<int, bool> get favoriteEvents => _favoriteEvents;

  void toggleFavorite(int eventId) {
    _favoriteEvents.update(eventId, (value) => !value, ifAbsent: () => true);
    update();
  }

  bool isFavorite(int eventId) {
    return _favoriteEvents.containsKey(eventId) && _favoriteEvents[eventId]!;
  }
}