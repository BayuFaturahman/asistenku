import 'package:AsistenKu/logged/dashboard/controller_dashboard.dart';
import 'package:AsistenKu/logged/home/controller_home.dart';
import 'package:AsistenKu/logged/profile/controller_profile.dart';
import 'package:AsistenKu/nonLogged/loggin/controller_user_login.dart';
import 'package:AsistenKu/nonLogged/onboardingSplash/controller_splash.dart';
import 'package:AsistenKu/nonLogged/register/controller_register.dart';
import 'package:AsistenKu/widget/pages/location_maps/controller_maps.dart';
import 'package:get/get.dart';

class ControllerBind extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(ControllerDashboard());
    Get.put(ControllerRegister());
    Get.put(ControllerMaps());
    Get.put(ControllerUserLogin());
    Get.put(ControllerHome());
    Get.put(AccountController());
  }
}
