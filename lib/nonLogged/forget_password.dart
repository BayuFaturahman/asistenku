import 'package:asistenku/nonLogged/onboardingSplash/page_onboarding.dart';
import 'package:asistenku/nonLogged/register/controller_register.dart';
import 'package:asistenku/shared/constants/constants.dart';
import 'package:asistenku/shared/helper/regex.dart';
import 'package:asistenku/widget/input/inpu_primary.dart';
import 'package:asistenku/widget/input/input_phone.dart';
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

class PageForgetPassword extends StatefulWidget {
  const PageForgetPassword({Key? key}) : super(key: key);

  @override
  PageForgetPasswordState createState() => PageForgetPasswordState();
}

class PageForgetPasswordState extends State<PageForgetPassword> {
  TextEditingController kodeVerifikasi = TextEditingController();
  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return AppColor.bodyColor.shade500;
    }
    return AppColor.successColor;
  }

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
                        },
                        child: const Icon(Icons.arrow_back)),
                    Text(
                      'Lupa Kata Sandi',
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
                    "Isi No.Handphone yang terdaftar untuk ",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: AppColor.bodyColor.shade600),
                  ),
                  Text(
                    "dapat akses ",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: AppColor.bodyColor.shade600),
                  ),
                ],
              ),
              verticalSpace(54),
              Image.asset(
                AppAssets.ilustrasiVerifikasi,
                width: 80,
                height: 160,
              ),
              verticalSpace(35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: InputPhone(
                    onChange: (val) {},
                    controller: kodeVerifikasi,
                    phoneNumber: (val) {}),
              ),
              verticalSpace(25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: ListTile(
                    title: const Text(
                      "Apakah anda telah mengisi dengan Benar? Pihak kami akan mengirim Kode Verifikasi untuk anda",
                      style: TextStyle(fontSize: 14),
                    ),
                    leading: Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                          print("val :" + isChecked.toString());
                          if (isChecked == true) {
                            // cRegister.insitution(true);
                          }
                          if (isChecked == false) {
                            // cRegister.insitution(false);
                          }
                        });
                      },
                    )),
              ),
              verticalSpace(20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 45),
                child: ButtonPrimary(
                  onPressed: () => Get.offAll(() => const PageForgetPassword()),
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
