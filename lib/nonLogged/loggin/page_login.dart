import 'package:asistenku/nonLogged/onboardingSplash/page_onboarding.dart';
import 'package:asistenku/widget/button_primary.dart';
import 'package:asistenku/widget/input_form_icon.dart';
import 'package:asistenku/widget/input_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageLoggin extends StatefulWidget {
  @override
  PageLogginState createState() => PageLogginState();
}

class PageLogginState extends State<PageLoggin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
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
                    "Loggin",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
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
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Hello Again !",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Welcome back you’ve been missed!",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: InputForm(
                  isPassword: false,
                  hintText: "Username",
                  icon: Icon(
                    Icons.person_outline,
                    size: 30,
                    color: Color(0xffA6B0BD),
                  )),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: InputPassword(
                  isPassword: true,
                  hintText: "Password",
                  icon: Icon(
                    Icons.lock_outline,
                    size: 30,
                    color: Color(0xffA6B0BD),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50, horizontal: 100),
              child: ButtonPrimary(
                onPressed: () => Get.offAll(() => PageOnboarding()),
                height: 60,
                radius: 15.0,
                label: 'Sign in',
                labelStyle:
                    const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
            ),

            const Center(
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Forgot Password? ",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Text(
                  "Register!",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
