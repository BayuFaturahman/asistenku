import 'package:AsistenKu/logged/home/notifikasi/page_detail_notif.dart';
import 'package:AsistenKu/shared/constants/assets.dart';
import 'package:AsistenKu/shared/constants/constants.dart';
import 'package:AsistenKu/shared/helper/regex.dart';
import 'package:AsistenKu/widget/appbar/appbar.dart';
import 'package:AsistenKu/widget/button_primary.dart';
import 'package:AsistenKu/widget/input/input_primary_password.dart';
import 'package:AsistenKu/widget/other/show_dialog.dart';
import 'package:AsistenKu/widget/pages/page_decoration_top.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageKeamanan extends StatefulWidget {
  const PageKeamanan({Key? key}) : super(key: key);

  @override
  State<PageKeamanan> createState() => _PageKeamananState();
}

class _PageKeamananState extends State<PageKeamanan> {
  TextEditingController kataSandiLama = TextEditingController();
  TextEditingController kataSandiBaru = TextEditingController();
  TextEditingController kataSandiKonfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 45),
        child: ButtonPrimary(
          onPressed: () {
            showPopUpConfirm(
                context: context,
                desc: "Apakah anda yakin ingin merubah kata sandi ?",
                functionYes: () {
                  Get.back();
                });
          },
          height: 60,
          radius: 15.0,
          label: 'Simpan',
          labelStyle:
              const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
      ),
      appBar: CustomAppBar(
        titleSpacing: 80,
        leadingIcon: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            size: 25,
            color: AppColor.bodyColor,
          ),
        ),
        title: 'Keamanan & Privasi',
      ),
      backgroundColor: AppColor.whiteColor,
      body: Column(
        children: [
          verticalSpace(20),
          Center(
            child: Image.asset(
              AppAssets.imageKeamanan,
              width: 150,
            ),
          ),
          verticalSpace(35),
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
              hintText: 'Kata sandi lama',
              prefixIcon: const Icon(
                Icons.lock,
                size: 30,
                color: Color(0xffA6B0BD),
              ),
              controller: kataSandiBaru,
              onChange: (String) {},
            ),
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
              hintText: 'Kata sandi baru',
              prefixIcon: const Icon(
                Icons.lock,
                size: 30,
                color: Color(0xffA6B0BD),
              ),
              controller: kataSandiBaru,
              onChange: (String) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: InputPasswordPrimary(
              validate: (value) {
                if (!isValidConfirmPassword(
                    password: value.toString(),
                    confirmPassword: kataSandiBaru.text,
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
        ],
      ),
    );
  }
}
