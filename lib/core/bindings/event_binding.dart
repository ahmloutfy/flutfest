import 'package:flutfest/logic/controllers/event_controller.dart';
import 'package:get/get.dart';
import 'package:flutfest/logic/models/create_event_view_model.dart';

class EventBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<EventController>(EventController(), permanent: true);
    Get.put<CreateEventViewModel>(CreateEventViewModel(), permanent: true);
  }
}