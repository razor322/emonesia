import 'package:emonesia/screens/result/result_screen.dart';
import 'package:get/get.dart';
import 'package:emonesia/screens/home/home_screen.dart';
import 'package:emonesia/screens/splash/splash_screen.dart';

class AppRoutes {
  static const main = '/';
  static const splash = '/splash';
  static const result = '/result';

  static final routes = [
    GetPage(
        name: splash,
        page: () => const SplashScreen(),
        transition: Transition.fadeIn),
    GetPage(name: main, page: () => HomeScreen()),
    GetPage(name: result, page: () => ResultScreen()),
  ];
}
