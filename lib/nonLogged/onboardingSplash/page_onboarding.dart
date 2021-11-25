import 'package:asistenku/nonLogged/onboardingSplash/into_screen.dart';
import 'package:asistenku/nonLogged/onboardingSplash/onboarding_data.dart';
import 'package:asistenku/nonLogged/onboardingSplash/page_start_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageOnboarding extends StatelessWidget {
  final List<OnbordingData> list = [
    OnbordingData(
      imagePath: "assets/ilustrasi/ilustrasi_1.png",
      title: "Cleaner",
      desc:
      "Cleaner is one of the features of Assistenku This feature provides a full house cleaning service, to find out more about the features of Assistenku , please continue",
    ),
    OnbordingData(
      imagePath: "assets/ilustrasi/ilustrasi_2.png",
      title: "Ironing",
      desc:
      "Iron is one of the features of the Assistant This feature provides services for ironing your clothes, to find out more about the features of Assistenku , please continue",
    ),
    OnbordingData(
      imagePath: "assets/ilustrasi/ilustrasi_3.png",
      title: "Washing",
      desc:
      "Washing is one of the features of the Assistant This feature provides laundry services, to find out more about the My Assistant feature, please continue",
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
