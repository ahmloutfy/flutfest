import 'package:flutfest/core/bindings/event_binding.dart';
import 'package:flutfest/views/home/screens/home_screen.dart';
import 'package:flutfest/views/login/login_screen.dart';
import 'package:flutfest/views/register/register_screen.dart';
import 'package:flutfest/views/welcome/welcome_screen.dart';
import 'package:flutfest/views/events/screens/create_event_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const String welcome = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String createEvent = '/create-event';

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
  ];
}