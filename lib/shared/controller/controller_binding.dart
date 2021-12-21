import 'package:AsistenKu/nonLogged/onboardingSplash/controller_splash.dart';
import 'package:get/get.dart';

class ControllerBind extends Bindings{
  @override
  void dependencies(){
    Get.put(SplashController());
  }
}