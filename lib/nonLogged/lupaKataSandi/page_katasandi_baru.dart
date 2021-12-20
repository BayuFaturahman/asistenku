import 'package:AsistenKu/nonLogged/onboardingSplash/page_onboarding.dart';
import 'package:AsistenKu/nonLogged/register/controller_register.dart';
import 'package:AsistenKu/nonLogged/register/page_otp.dart';
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

class PageKataSandiBaru extends StatefulWidget {
  const PageKataSandiBaru({Key? key}) : super(key: key);

  @override
  PageKataSandiBaruState createState() => PageKataSandiBaruState();
}

class PageKataSandiBaruState extends State<PageKataSandiBaru> {
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: InputPasswordPrimary(
                  validate: (value) {
                    if (!isValidPassword(password: value.toString())) {
                      return '- Password minimal 8 karakter\n' +
                          '- Diawali huruf kapital\n' +
                          '- Terdiri dari huruf besar, huruf kecil, angka dan symbol (!@#\$%^&*(),.?":{}|<>])';
                    }
                  },
                  hintText: 'Kata sandi baru',
                  prefixIcon: const Icon(
                    Icons.lock,
                    size: 30,
                    color: Color(0xffA6B0BD),
                  ),
                  controller: kataSandi,
                  onChange: (String) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: InputPasswordPrimary(
                  validate: (value) {
                    if (!isValidConfirmPassword(
                        password: value.toString(),
                        confirmPassword: kataSandi.text,
                        minLength: 8)) {
                      return 'Kata Sandi Tidak Sesuai!';
                    }
                  },
                  hintText: 'Konfirmas kata sandi baru',
                  prefixIcon: const Icon(
                    Icons.lock,
                    size: 30,
                    color: Color(0xffA6B0BD),
                  ),
                  controller: kataSandiKonfirm,
                  onChange: (String) {},
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 45),
                child: ButtonPrimary(
                  onPressed: () {
                    showPopUp(
                        imageUri: AppAssets.imageSuccess,
                        imageSize: 80,
                        onPress: () {
                          Get.back();
                        },
                        description:
                            'Anda berhasil menyimpan kata sandi baru anda');
                  },
                  height: 60,
                  radius: 15.0,
                  label: 'Simpan',
                  labelStyle: const TextStyle(
                      fontSize: 21, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
