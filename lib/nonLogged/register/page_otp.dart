import 'package:AsistenKu/nonLogged/onboardingSplash/page_onboarding.dart';
import 'package:AsistenKu/nonLogged/register/controller_register.dart';
import 'package:AsistenKu/shared/constants/constants.dart';
import 'package:AsistenKu/shared/helper/regex.dart';
import 'package:AsistenKu/widget/input/inpu_primary.dart';
import 'package:AsistenKu/widget/input/input_primary_password.dart';
import 'package:AsistenKu/widget/other/show_dialog.dart';
import 'package:AsistenKu/widget/pages/location_maps/controller_maps.dart';
import 'package:AsistenKu/widget/pages/location_maps/page_location.dart';
import 'package:AsistenKu/widget/pages/location_maps/page_location.dart';
import 'package:AsistenKu/widget/button_primary.dart';
import 'package:AsistenKu/widget/input/input_form.dart';
import 'package:AsistenKu/widget/input/input_form_icon.dart';
import 'package:AsistenKu/widget/input/input_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PageOtp extends StatefulWidget {
  const PageOtp({Key? key}) : super(key: key);

  @override
  PageOtpState createState() => PageOtpState();
}

class PageOtpState extends State<PageOtp> {
  TextEditingController otp = TextEditingController();
  ControllerRegister cRegister = ControllerRegister();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/background.png"))),
        child: SafeArea(
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                          Get.back();

                          print("balik");
                        },
                        child: const Icon(Icons.arrow_back)),
                    Text(
                      'Verifikasi',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.bodyColor.shade600),
                    ),
                    const SizedBox()
                  ],
                ),
              ),
              verticalSpace(5),
              Column(
                children: [
                  Text(
                    "Kami mengirimkan Kode verifikasi ",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: AppColor.bodyColor.shade600),
                  ),
                  Text(
                    "melalui SMS anda ",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: AppColor.bodyColor.shade600),
                  ),
                ],
              ),
              verticalSpace(54),
              Image.asset(
                AppAssets.ilustrasiHp,
                width: 80,
                height: 160,
              ),
              verticalSpace(35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: InputPrimary(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    hintText: "Kode verifikasi",
                    onChange: (val) {},
                    controller: otp),
              ),
              verticalSpace(70),
              Column(
                children: [
                  Text(
                    "(00.58)",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: AppColor.bodyColor.shade600),
                  ),
                  verticalSpace(10),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Kirim ulang kode ?",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColor.bodyColor.shade600),
                    ),
                  ),
                ],
              ),
              verticalSpace(20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 45),
                child: ButtonPrimary(
                  onPressed: () {
                    _submit();
                  },
                  height: 60,
                  radius: 15.0,
                  label: 'Kirim',
                  labelStyle: const TextStyle(
                      fontSize: 21, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _submit() async {
    try {
      final value = cRegister.otpVerifikasi(
          phone: cRegister.phoneCustumer.value,
          otp: otp.text,
          token: cRegister.token.value);
      print("VALUE DI UI : " + value.toString());
      if (value != null) {
        showPopUp(
            imageUri: AppAssets.imageSuccess,
            imageSize: 80,
            onPress: () {
              const PageOtp();
            },
            description: 'Verifikasi Berhasil');
      }
    } catch (e) {
      showPopUpError(
        errorMessage: e.toString(),
      );
    }
  }
}
