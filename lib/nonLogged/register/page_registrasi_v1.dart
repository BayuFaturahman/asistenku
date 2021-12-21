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
import 'package:loading_overlay/loading_overlay.dart';

class PageRegistrasiV1 extends StatefulWidget {
  const PageRegistrasiV1({Key? key}) : super(key: key);

  @override
  PageRegistrasiV1State createState() => PageRegistrasiV1State();
}

class PageRegistrasiV1State extends State<PageRegistrasiV1> {
  ControllerRegister cRegister = ControllerRegister();

  TextEditingController nama = TextEditingController();
  TextEditingController noHp = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController kataSandi = TextEditingController();
  TextEditingController kataSandiKonfirm = TextEditingController();

  bool isValidRegis = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/background.png"))),
        child: Obx(()=>LoadingOverlay(
            isLoading: cRegister.isLoading.value,
            color: Colors.transparent,
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
                            onTap: () => Get.back(),
                            child: const Icon(Icons.arrow_back)),
                        const Text(
                          'Regstrasi',
                          style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox()
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Isi data akun anda dengan benar",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17.0),
                    child: InputPrimary(
                        hintText: "Nama penguna",
                        onChange: (val) {
                          _validateFormRegistarsi(setState);
                        },
                        controller: nama),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17.0),
                    child: InputPrimary(
                        keyboardType: TextInputType.number,
                        prefixIcon: const Icon(
                          Icons.phone_android,
                          size: 30,
                          color: Color(0xffA6B0BD),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        hintText: "No.Handphone",
                        onChange: (val) {
                          _validateFormRegistarsi(setState);

                        },
                        validate: (value) {
                          if (!GetUtils.isPhoneNumber(value.toString())) {
                            return 'Masukan No.Handphone Dengan Benar';
                          }
                        },
                        controller: noHp),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17.0),
                    child: InputPrimary(
                        hintText: "Email anda",
                        controller: email,
                        onChange: (val) {
                          _validateFormRegistarsi(setState);

                        },
                        validate: (value) {
                          if (!GetUtils.isEmail(value.toString())) {
                            return 'Format email belum benar';
                          }
                          return null;
                        },
                        prefixIcon: const Icon(
                          Icons.person,
                          size: 30,
                          color: Color(0xffA6B0BD),
                        )),
                  ),
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
                      hintText: 'Masukan kata sandi',
                      prefixIcon: const Icon(
                        Icons.lock,
                        size: 30,
                        color: Color(0xffA6B0BD),
                      ),
                      controller: kataSandi,
                      onChange: (val) {
                        _validateFormRegistarsi(setState);

                      },
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
                      hintText: 'Masukan kata sandi',
                      prefixIcon: const Icon(
                        Icons.lock,
                        size: 30,
                        color: Color(0xffA6B0BD),
                      ),
                      controller: kataSandiKonfirm,
                      onChange: (val) {
                        _validateFormRegistarsi(setState);

                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 45),
                    child: ButtonPrimary(
                      onPressed: () {
                        if(isValidRegis){
                          _submit();
                        }else{
                          showPopUpError(errorMessage: 'Mohon maap semua form registrasi harus diisi !');
                        }
                      },
                      height: 60,
                      radius: 15.0,
                      label: 'Daftar',
                      labelStyle: const TextStyle(
                          fontSize: 21, fontWeight: FontWeight.bold),
                      enable: isValidRegis,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

   _submit() async {
      var value = await cRegister.registerUser(
          name: nama.text,
          phone: noHp.text,
          email: email.text,
          password: kataSandiKonfirm.text,
          role: 'customer');
      print("VALUE DI UI : " + value.toString());
      print("code : " + cRegister.statusCode.value.toString());
      if (cRegister.statusCode.value == 200) {
        showPopUp(
            imageUri: AppAssets.imageSuccess,
            imageSize: 80,
            onPress: () => Get.to(() => const PageOtp()),
            description:
                'Kami akan mengirim code verifikasi melalui SMS anda ');
      }else{
        showPopUp(
            imageUri: AppAssets.imageEror,
            imageSize: 80,
            onPress: () => Get.back(),
            description:
            cRegister.statusCode.value == '201' ? 'Mohon maaf anda email ini sudah terdaftar, Silahkan gunakan email lain' : 'Daftar akun tidak berhasil');
      }
  }


  void _validateFormRegistarsi(void Function(void Function()) setState) {
    if (nama.text.isNotEmpty && noHp.text.isNotEmpty && email.text.isNotEmpty && kataSandiKonfirm.text.isNotEmpty) {
      setState(() => isValidRegis = true);
    } else {
      setState(() => isValidRegis = false);
    }
  }}
