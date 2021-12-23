import 'package:AsistenKu/logged/help/controller_help.dart';
import 'package:AsistenKu/logged/inbox/controller_inbox.dart';
import 'package:AsistenKu/shared/constants/assets.dart';
import 'package:AsistenKu/shared/constants/colors.dart';
import 'package:AsistenKu/shared/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageHelp extends GetView<ControllerHelp> {
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
          Text("Mohon maaf fitur ini sedang dalam development !",style: TextStyles.subtitle1)
        ],
      ),
    );
  }
}
