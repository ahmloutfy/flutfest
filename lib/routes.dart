import 'package:flutfest/views/home/screens/home_screen.dart';
import 'package:flutfest/views/login/login_screen.dart';
import 'package:flutfest/views/register/register_screen.dart';
import 'package:flutfest/views/welcome/welcome_screen.dart';
import 'package:get/get.dart';

class Routes {
  // Define all the named routes in this class
  static const String welcome = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';

  static List<GetPage> pages = [
    // Define the mapping for each route
    GetPage(name: welcome, page: () => const WelcomeScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: register, page: () => const RegisterScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
  ];
}
