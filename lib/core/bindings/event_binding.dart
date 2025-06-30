import 'package:get/get.dart';
import 'package:flutfest/logic/models/create_event_view_model.dart';

class EventBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CreateEventViewModel(), permanent: true);
  }
}
