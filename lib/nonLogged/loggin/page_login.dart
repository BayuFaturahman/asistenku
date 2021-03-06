import 'package:AsistenKu/logged/dashboard/page_dashboard.dart';
import 'package:AsistenKu/nonLogged/lupaKataSandi/page_lupa_katasandi.dart';
import 'package:AsistenKu/nonLogged/onboardingSplash/page_onboarding.dart';
import 'package:AsistenKu/nonLogged/register/page_register.dart';
import 'package:AsistenKu/nonLogged/register/page_registrasi_v1.dart';
import 'package:AsistenKu/shared/constants/constants.dart';
import 'package:AsistenKu/shared/helper/regex.dart';
import 'package:AsistenKu/widget/button_primary.dart';
import 'package:AsistenKu/widget/input/inpu_primary.dart';
import 'package:AsistenKu/widget/input/input_form_icon.dart';
import 'package:AsistenKu/widget/input/input_password.dart';
import 'package:AsistenKu/widget/input/input_phone.dart';
import 'package:AsistenKu/widget/input/input_primary_password.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class PageLoggin extends StatefulWidget {
  @override
  PageLogginState createState() => PageLogginState();
}

class PageLogginState extends State<PageLoggin> {
  double myLat = -6.905977;
  double myLong = 107.613144;

  TextEditingController email = TextEditingController();
  TextEditingController noHp = TextEditingController();
  TextEditingController kataSandi = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _getLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    myLat = position.latitude;
    myLong = position.longitude;
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
              child: ListView(children: [
                const SizedBox(
                  height: 20,
                ),

                //content
                SizedBox(
                  height: Get.height / 4,
                  width: Get.width / 1.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo/hands.png',
                        height: 37,
                        width: 37,
                      ),
                      verticalSpace(20),
                      const Text(
                        "Hallo",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      verticalSpace(10),
                      const SizedBox(
                        width: 400,
                        child: Text(
                          "Selamat Datang Di Aplikasi AsistenKu",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      verticalSpace(20),
                    ],
                  ),
                ),
                DefaultTabController(
                  length: 2,
                  child: Column(
                    children: <Widget>[
                      Container(
                        constraints: const BoxConstraints.expand(height: 50),
                        child: TabBar(
                            indicatorSize: TabBarIndicatorSize.label,
                            labelColor: AppColor.bodyColor,
                            tabs: [
                              Tab(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppAssets.icEmail,
                                      height: 28,
                                      width: 28,
                                    ),
                                    horizontalSpace(10),
                                    const Text('Email')
                                  ],
                                ),
                              ),
                              Tab(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppAssets.icHp,
                                      height: 28,
                                      width: 28,
                                    ),
                                    horizontalSpace(10),
                                    const Text('No.Hp')
                                  ],
                                ),
                              ),
                            ]),
                      ),
                      verticalSpace(10),
                      SizedBox(
                        height: 220,
                        child: TabBarView(children: [
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: InputPrimary(
                                    hintText: "Masukkan email",
                                    controller: email,
                                    onChange: (String) {},
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: InputPasswordPrimary(
                                  validate: (value) {
                                    if (!isValidPassword(
                                        password: value.toString())) {
                                      return '- Password minimal 8 karakter\n' +
                                          '- Diawali huruf kapital\n' +
                                          '- Terdiri dari huruf besar, huruf kecil, angka dan symbol (!@#\$%^&*(),.?":{}|<>])';
                                    }
                                  },
                                  hintText: 'Masukkan kata sandi',
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    size: 30,
                                    color: Color(0xffA6B0BD),
                                  ),
                                  controller: kataSandi,
                                  onChange: (String) {},
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: InputPhone(
                                  hintText: '812xxxxxxxxx',
                                    onChange: (val) {},
                                    controller: noHp,
                                    phoneNumber: (val) {}),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: InputPasswordPrimary(
                                  validate: (value) {
                                    if (!isValidPassword(
                                        password: value.toString())) {
                                      return '- Password minimal 8 karakter\n' +
                                          '- Diawali huruf kapital\n' +
                                          '- Terdiri dari huruf besar, huruf kecil, angka dan symbol (!@#\$%^&*(),.?":{}|<>])';
                                    }
                                  },
                                  hintText: 'Masukkan kata sandi',
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    size: 30,
                                    color: Color(0xffA6B0BD),
                                  ),
                                  controller: kataSandi,
                                  onChange: (String) {},
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 45),
                        child: ButtonPrimary(
                          onPressed: () {
                            if (email.text.isNotEmpty &&
                                kataSandi.text.isNotEmpty) {
                              Get.offAll(() => DashboardPage(
                                    lat: myLat,
                                    long: myLong,
                                  ));
                            } else {
                              print("Masukan Email & Kata Sandi Yaa !");
                            }
                          },
                          height: 60,
                          radius: 15.0,
                          label: 'Masuk',
                          labelStyle: const TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Center(
                        child: InkWell(
                          onTap: () => Get.to(() => PageForgetPassword()),
                          child: const Text(
                            "Lupa Kata Sandi ?",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                      ),
                      verticalSpace(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Apakah kamu belum memiliki akun ? ",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          InkWell(
                            onTap: () => Get.to(() => PageRegistrasiV1()),
                            child: const Text(
                              "Daftar !",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(200)
                    ],
                  ),
                ),
              ]),
            )));
  }
}
