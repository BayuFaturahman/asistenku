import 'package:AsistenKu/app/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(
    GetMaterialApp(
      title: "AsistenKu",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}