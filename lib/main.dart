import 'package:asistenku/logged/dashboard/controller_dashboard.dart';
import 'package:asistenku/logged/home/controller_home.dart';
import 'package:asistenku/logged/profile/controller_profile.dart';
import 'package:asistenku/nonLogged/onboardingSplash/page_start_app.dart';
import 'package:asistenku/nonLogged/register/controller_register.dart';
import 'package:asistenku/widget/pages/location_maps/controller_maps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  Get.put(ControllerRegister());
  Get.put(ControllerMaps());
  Get.lazyPut<ControllerDashboard>(() => ControllerDashboard());
  Get.lazyPut<ControllerHome>(() => ControllerHome());
  Get.lazyPut<AccountController>(() => AccountController());


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=> ControllerRegister());

    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageStartApp(),
    );
  }
}
