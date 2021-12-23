import 'package:AsistenKu/logged/dashboard/controller_dashboard.dart';
import 'package:AsistenKu/logged/profile/controller_profile.dart';
import 'package:AsistenKu/logged/profile/page_keamanan.dart';
import 'package:AsistenKu/logged/profile/page_profile_edit.dart';
import 'package:AsistenKu/logged/profile/page_riwayat.dart';
import 'package:AsistenKu/logged/profile/page_syarat.dart';
import 'package:AsistenKu/nonLogged/loggin/controller_user_login.dart';
import 'package:AsistenKu/nonLogged/loggin/page_login.dart';
import 'package:AsistenKu/shared/constants/constants.dart';
import 'package:AsistenKu/widget/button_primary.dart';
import 'package:AsistenKu/widget/other/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends GetView<AccountController> {
  final dataUser;

  AccountPage(this.dataUser, {Key? key}) : super(key: key);
  final ControllerDashboard cDashboard = Get.find<ControllerDashboard>();
  final ControllerUserLogin cUser = Get.find<ControllerUserLogin>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFE5E5E5),
      body: Stack(
        children: [
          Image.asset(
            AppAssets.imageCardHome,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Container(
              height: Get.height / 1.5,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/profile1.png",
                                  width: 70,
                                ),
                                horizontalSpace(25),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      dataUser['name'] ?? "Fulan",
                                      // dataUser['name'],
                                      style: TextStyles.h5.copyWith(
                                        color: AppColor.bodyColor,
                                      ),
                                    ),
                                    Text(
                                      cUser.dataUserInfo['phoneNumber'] ?? "",
                                      // dataUser['name'],
                                      style: TextStyles.body2.copyWith(
                                        color: AppColor.bodyColor,
                                      ),
                                    ),
                                    Text(
                                      cUser.dataUserInfo['email'] ?? "",
                                      // dataUser['name'],
                                      style: TextStyles.body2.copyWith(
                                        color: AppColor.bodyColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            verticalSpace(20),
                            InkWell(
                              onTap: () {
                                Get.to(() => PageEditProfile(
                                      nama: dataUser['name'] ?? "",
                                      noHp: cUser.dataUserInfo['phoneNumber'] ??
                                          "",
                                      email: cUser.dataUserInfo['email'] ?? "",
                                    ));
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                child: Icon(
                                  Icons.edit,
                                  size: 28,
                                  color: AppColor.bodyColor.shade700,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.bodyColor.shade300,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    verticalSpace(20),
                    Container(
                      height: 1.0,
                      color: AppColor.bodyColor.shade200,
                    ),
                    verticalSpace(20),
                    Row(
                      children: [
                        Text(
                          'Akun',
                          // dataUser['name'],
                          style: TextStyles.h5.copyWith(
                            color: AppColor.bodyColor,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(30),
                    InkWell(
                      onTap: () {
                        Get.to(() => const PageRiwayat());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AppAssets.iconRiwayat,
                                width: 25,
                              ),
                              horizontalSpace(20),
                              Text(
                                'Riwayat Pesanan',
                                style: TextStyles.body1.copyWith(
                                  color: AppColor.bodyColor,
                                ),
                              ),
                            ],
                          ),
                          Image.asset(
                            AppAssets.icBack,
                            width: 10,
                          )
                        ],
                      ),
                    ),
                    verticalSpace(30),
                    InkWell(
                      onTap: () {
                        Get.to(() => PageKeamanan());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AppAssets.iconKeamanan,
                                width: 25,
                              ),
                              horizontalSpace(20),
                              Text(
                                'Keamanan & Privasi',
                                style: TextStyles.body1.copyWith(
                                  color: AppColor.bodyColor,
                                ),
                              ),
                            ],
                          ),
                          Image.asset(
                            AppAssets.icBack,
                            width: 10,
                          )
                        ],
                      ),
                    ),
                    verticalSpace(30),
                    InkWell(
                      onTap: () {
                        Get.to(() => const PageSyarat());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AppAssets.iconSyarat,
                                width: 25,
                              ),
                              horizontalSpace(20),
                              Text(
                                'Syarat & Ketentuan',
                                style: TextStyles.body1.copyWith(
                                  color: AppColor.bodyColor,
                                ),
                              ),
                            ],
                          ),
                          Image.asset(
                            AppAssets.icBack,
                            width: 10,
                          )
                        ],
                      ),
                    ),
                    verticalSpace(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            showPopUpConfirm(
                                context: context,
                                desc:
                                    'Apakah Anda Yakin Ingin Keluar Aplikasi? ',
                                functionYes: () {
                                  cDashboard.tabIndex(0);
                                  Get.offAll(() => PageLoggin());
                                });
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                AppAssets.iconKeluar,
                                width: 25,
                              ),
                              horizontalSpace(20),
                              Text(
                                'Keluar',
                                style: TextStyles.body1.copyWith(
                                  color: AppColor.bodyColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          AppAssets.icBack,
                          width: 10,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(10)),
            ),
          )

          // Center(child: ButtonPrimary(onPressed: (){
          //   showPopUpConfirm(context: context, desc: 'Apakah Yakin Ingin Keluar ? ', functionYes: (){
          //     cDashboard.tabIndex(0);
          //     Get.offAll(()=>PageLoggin());
          //   });
          // }, label: "Keluar",size: 80,))
        ],
      ),
    );
  }
}
