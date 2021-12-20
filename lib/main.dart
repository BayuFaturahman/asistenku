import 'package:asistenku/logged/dashboard/controller_dashboard.dart';
import 'package:asistenku/logged/home/controller_home.dart';
import 'package:asistenku/logged/profile/controller_profile.dart';
import 'package:asistenku/nonLogged/onboardingSplash/page_onboarding.dart';
import 'package:asistenku/nonLogged/onboardingSplash/page_splash_screen.dart';
import 'package:asistenku/nonLogged/onboardingSplash/page_start_app.dart';
import 'package:asistenku/nonLogged/register/controller_register.dart';
import 'package:asistenku/shared/constants/constants.dart';
import 'package:asistenku/widget/pages/location_maps/controller_maps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

  Get.put(ControllerRegister());
  Get.put(ControllerMaps());
  Get.lazyPut<ControllerDashboard>(() => ControllerDashboard());
  Get.lazyPut<ControllerHome>(() => ControllerHome());
  Get.lazyPut<AccountController>(() => AccountController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Init.instance.initialize(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(home: PageSplash());
          } else {
            return GetMaterialApp(
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: PageOnboarding(),
            );
          }
        });
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    await Future.delayed(const Duration(seconds: 3));
  }
}
