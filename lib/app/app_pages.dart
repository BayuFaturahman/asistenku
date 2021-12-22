import 'package:AsistenKu/logged/dashboard/controller_dashboard.dart';
import 'package:AsistenKu/logged/dashboard/page_dashboard.dart';
import 'package:AsistenKu/logged/home/controller_home.dart';
import 'package:AsistenKu/logged/profile/controller_profile.dart';
import 'package:AsistenKu/nonLogged/loggin/controller_user_login.dart';
import 'package:AsistenKu/nonLogged/loggin/page_login.dart';
import 'package:AsistenKu/nonLogged/onboardingSplash/controller_splash.dart';
import 'package:AsistenKu/nonLogged/onboardingSplash/page_onboarding.dart';
import 'package:AsistenKu/nonLogged/onboardingSplash/page_splash_screen.dart';
import 'package:AsistenKu/nonLogged/register/controller_register.dart';
import 'package:AsistenKu/shared/controller/controller_binding.dart';
import 'package:AsistenKu/widget/pages/location_maps/controller_maps.dart';
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
    GetPage(
      name: _Paths.HOME,
      page: () => PageLoggin(),
      binding: ControllerBind(),
    ),
  ];
}
