import 'package:AsistenKu/nonLogged/onboardingSplash/controller_splash.dart';
import 'package:AsistenKu/shared/constants/assets.dart';
import 'package:AsistenKu/shared/constants/colors.dart';
import 'package:AsistenKu/shared/constants/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController>  {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Version 1.0',
              style: TextStyles.body2,
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "AsistenKu",
            style: TextStyles.body1.copyWith(color: AppColor.primaryColor),
          ),
          verticalSpace(50),
          Center(
            child: Image.asset(
              AppAssets.logoUtama,
              width: 150,
              height: 150,
            ),
          )
        ],
      ),
    );
  }
}
