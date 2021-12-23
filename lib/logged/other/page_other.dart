import 'package:AsistenKu/logged/other/controller_other.dart';
import 'package:AsistenKu/shared/constants/assets.dart';
import 'package:AsistenKu/shared/constants/colors.dart';
import 'package:AsistenKu/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsPage extends GetView<ControllerNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: Container(
              child: Image.asset(AppAssets.ilustrasiMaintance)
            ),
          ),
          Text("Mohon maaf fitur ini sedang dalam pembangunan !",style: TextStyles.subtitle1)
        ],
      ),
    );
  }
}
