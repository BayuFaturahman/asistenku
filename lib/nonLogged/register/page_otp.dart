import 'package:asistenku/nonLogged/onboardingSplash/page_onboarding.dart';
import 'package:asistenku/nonLogged/register/controller_register.dart';
import 'package:asistenku/shared/constants/constants.dart';
import 'package:asistenku/shared/helper/regex.dart';
import 'package:asistenku/widget/input/inpu_primary.dart';
import 'package:asistenku/widget/input/input_primary_password.dart';
import 'package:asistenku/widget/pages/location_maps/controller_maps.dart';
import 'package:asistenku/widget/pages/location_maps/page_location.dart';
import 'package:asistenku/widget/pages/location_maps/page_location.dart';
import 'package:asistenku/widget/button_primary.dart';
import 'package:asistenku/widget/input/input_form.dart';
import 'package:asistenku/widget/input/input_form_icon.dart';
import 'package:asistenku/widget/input/input_password.dart';
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
  TextEditingController nama = TextEditingController();
  TextEditingController noHp = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController kataSandi = TextEditingController();
  TextEditingController kataSandiKonfirm = TextEditingController();

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
                    controller: noHp),
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
                  onPressed: () => Get.offAll(() => const PageOtp()),
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
}
