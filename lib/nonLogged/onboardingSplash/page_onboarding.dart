import 'package:AsistenKu/nonLogged/onboardingSplash/into_screen.dart';
import 'package:AsistenKu/nonLogged/onboardingSplash/onboarding_data.dart';
import 'package:AsistenKu/nonLogged/onboardingSplash/page_start_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageOnboarding extends StatelessWidget {
  final List<OnbordingData> list = [
    OnbordingData(
      imagePath: "assets/ilustrasi/ilustrasi_1.png",
      title: "AsistenKu",
      desc:
          "Hello, AsistenKu adalah aplikasi serbaguna yang dapat membantu anda, dan sangat terjangkau",
    ),
    OnbordingData(
      imagePath: "assets/ilustrasi/ilustrasi_2.png",
      title: "Pekerjaan rumah anda",
      desc:
          "Dapat dengan mudah mencari service layanan pekerjaan rumah anda dengan efisien&efektif",
    ),
    OnbordingData(
      imagePath: "assets/ilustrasi/ilustrasi_3.png",
      title: "Worker Berpengalaman",
      desc:
          "Kami sudah menyeleksi para worker dengan sedemikian mungkin, untuk kenyamanan anda",
      isButton: 'true',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: IntroScreen(
          list,
          MaterialPageRoute(builder: (context) => PageStartApp()),
        ),
      ),
    );
  }
}
