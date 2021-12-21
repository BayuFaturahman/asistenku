import 'package:AsistenKu/nonLogged/loggin/page_login.dart';
import 'package:AsistenKu/nonLogged/onboardingSplash/page_onboarding.dart';
import 'package:AsistenKu/nonLogged/onboardingSplash/page_splash_screen.dart';
import 'package:AsistenKu/shared/controller/controller_binding.dart';
import 'package:get/get.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: ControllerBind(),
    ),
    GetPage(
      name: _Paths.INTROSCREEN,
      page: () => PageOnboarding(),
      binding: ControllerBind(),
    ),
  ];
}