import 'package:AsistenKu/logged/dashboard/controller_dashboard.dart';
import 'package:AsistenKu/logged/profile/controller_profile.dart';
import 'package:AsistenKu/nonLogged/loggin/controller_user_login.dart';
import 'package:AsistenKu/nonLogged/loggin/page_login.dart';
import 'package:AsistenKu/shared/constants/constants.dart';
import 'package:AsistenKu/widget/button_primary.dart';
import 'package:AsistenKu/widget/other/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends GetView<AccountController> {
   AccountPage({Key? key}) : super(key: key);
  final ControllerDashboard cDashboard = Get.find<ControllerDashboard>();
   final ControllerUserLogin cUser = Get.find<ControllerUserLogin>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
       Text(cUser.nama.value,style:TextStyles.body1.copyWith(color: AppColor.bodyColor,)),

          Center(child: ButtonPrimary(onPressed: (){
            showPopUpConfirm(context: context, desc: 'Apakah Yakin Ingin Keluar ? ', functionYes: (){
              cDashboard.tabIndex(0);
              Get.offAll(()=>PageLoggin());
            });
          }, label: "Keluar",size: 80,))
        ],
      ),
    );
  }
}
