import 'package:asistenku/logged/dashboard/page_dashboard.dart';
import 'package:asistenku/nonLogged/onboardingSplash/page_onboarding.dart';
import 'package:asistenku/nonLogged/register/page_register.dart';
import 'package:asistenku/shared/constants/constants.dart';
import 'package:asistenku/widget/button_primary.dart';
import 'package:asistenku/widget/input_form_icon.dart';
import 'package:asistenku/widget/input_password.dart';
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
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              // //head
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: const [
              //       Text(
              //         "Loggin",
              //         style:
              //             TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //       ),
              //     ],
              //   ),
              // ),
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    verticalSpace(10),
                    const SizedBox(
                      width: 200,
                      child:  Text(
                        "Selamat Datang Di Aplikasi Asistenku",
                        style:
                            TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    verticalSpace(20),

                  ],
                ),
              ),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: InputFormIcon(
                    isPassword: false,
                    hintText: "Masukan email",
                    controller: email,
                    hintTextStyle: TextStyle(color: AppColor.bodyColor.shade700),
                    icon: const Icon(
                      Icons.person,
                      size: 30,
                      color: Color(0xffA6B0BD),
                    )),
              ),
               Padding(
                padding:const  EdgeInsets.symmetric(horizontal: 30),
                child: InputPassword(
                    isPassword: true,
                    hintText: "Masukan kata sandi",
                    controller:kataSandi,
                    hintTextStyle: TextStyle(color: AppColor.bodyColor.shade700),
                    icon: const Icon(
                      Icons.lock,
                      size: 30,
                      color: Color(0xffA6B0BD),
                    )),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 45),
                child: ButtonPrimary(
                  onPressed: () {
                    if(email.text.isNotEmpty && kataSandi.text.isNotEmpty){
                      Get.offAll(() => DashboardPage(
                          lat: myLat,
                          long: myLong,
                        ));
                    }else{
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

              const Center(
                child: Text(
                  "Lupa Kata Sandi ?",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
              verticalSpace(50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Apakah kamu belum memiliki akun ? ",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  InkWell(
                    onTap: () => Get.to(() => PageRegister()),
                    child: const Text(
                      "Daftar !",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
