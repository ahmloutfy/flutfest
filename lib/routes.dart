import 'package:flutfest/core/bindings/event_binding.dart';
import 'package:flutfest/logic/models/event_model.dart';
import 'package:flutfest/views/booking/booking_confirmation_screen.dart';
import 'package:flutfest/views/events/screens/create_event_screen.dart';
import 'package:flutfest/views/home/screens/home_screen.dart';
import 'package:flutfest/views/login/login_screen.dart';
import 'package:flutfest/views/register/register_screen.dart';
import 'package:flutfest/views/welcome/welcome_screen.dart';
import 'package:get/get.dart';

import 'views/details/event_details_screen.dart';
import 'views/edit_profile/edit_profile_screen.dart';
import 'views/help_support/help_suppport_screen.dart';
import 'views/notifications/notifications_screen.dart';
import 'views/search/search_screen.dart';
import 'views/settings/settings_screen.dart';

class Routes {
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String createEvent = '/create-event';
  static const String eventDetails = '/event-details';
  static const String bookingConfirmation = '/booking-confirmation';
  static const String notifications = '/notifications';
  static const String editProfile = '/edit-profile';
  static const String settings = '/settings';
  static const String helpSupport = '/help-support';
  static const String search = '/search';



  static List<GetPage> pages = [
    GetPage(name: welcome, page: () => const WelcomeScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: register, page: () => const RegisterScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(
      name: createEvent,
      page: () => CreateEventScreen(),
      binding: EventBinding(),
    ),
    GetPage(
      name: eventDetails,
      page: () {
        final event = Get.arguments as EventModel;
        return EventDetailsScreen(event: event);
      },
      binding: EventBinding(),
    ),
    GetPage(
      name: bookingConfirmation,
      page: () {
        final event = Get.arguments as EventModel;
        return BookingConfirmationScreen(event: event);
      },
    ),
    GetPage(
      name: notifications,
      page: () => const NotificationsScreen(),
    ),
    GetPage(
      name: editProfile,
      page: () => EditProfileScreen(),
    ),
    GetPage(
      name: settings,
      page: () =>  SettingsScreen(),
    ),
    GetPage(
      name: helpSupport,
      page: () => const HelpSupportScreen(),
    ),
    GetPage(
      name: search,
      page: () =>  SearchScreen(),
    ),

  ];
}
