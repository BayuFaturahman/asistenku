import 'package:AsistenKu/nonLogged/onboardingSplash/page_onboarding.dart';
import 'package:AsistenKu/widget/button_primary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageStartApp extends StatefulWidget {
  @override
  PageStartAppState createState() => PageStartAppState();
}

class PageStartAppState extends State<PageStartApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 100),
        child: ButtonPrimary(
          onPressed: () => Get.offAll(() => PageOnboarding()),
          height: 60,
          radius: 15.0,
          label: 'Get Started !',
          labelStyle:
              const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            //head
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Assistenku",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            //content
            SizedBox(
              height: Get.height / 2,
              width: Get.width / 1.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo/logo.png',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Welcomes",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "AsistenKu. is a household assistant service provider. such as cleaning the house, washing clothes and so on",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
