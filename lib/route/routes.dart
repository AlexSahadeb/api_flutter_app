import 'package:api_app/view/home.dart';
import 'package:api_app/view/splash.dart';
import 'package:get/get.dart';

const String splash = "/splash";

const String home = "/home";

List<GetPage> getpage = [
  GetPage(
    name: splash,
    page: () => SplashScreen(),
  ),
  GetPage(name: home, page: () => HomeScreen())
];
