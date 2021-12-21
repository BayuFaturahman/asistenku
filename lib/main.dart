import 'package:AsistenKu/app/app_pages.dart';
import 'package:AsistenKu/logged/dashboard/controller_dashboard.dart';
import 'package:AsistenKu/widget/pages/location_maps/controller_maps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logged/home/controller_home.dart';
import 'logged/profile/controller_profile.dart';
import 'nonLogged/loggin/controller_user_login.dart';
import 'nonLogged/register/controller_register.dart';

void main() {
  Get.put(ControllerDashboard());
  Get.put(ControllerRegister());
  Get.put(ControllerMaps());
  Get.put(ControllerUserLogin());
  Get.put(ControllerHome());
  Get.put(AccountController());
  runApp(
    GetMaterialApp(
      title: "AsistenKu",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}