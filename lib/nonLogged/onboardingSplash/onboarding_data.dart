import 'package:AsistenKu/nonLogged/loggin/page_login.dart';
import 'package:AsistenKu/shared/constants/constants.dart';
import 'package:AsistenKu/widget/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnbordingData extends StatefulWidget {
  final imagePath;
  final title;
  final desc;
  final isButton;

  OnbordingData({this.imagePath, this.title, this.desc, this.isButton});

  @override
  _OnbordingDataState createState() =>
      _OnbordingDataState(this.imagePath, this.title, this.desc, this.isButton);
}

class _OnbordingDataState extends State<OnbordingData> {
  final imagePath;
  final title;
  final desc;
  final isButton;

  _OnbordingDataState(this.imagePath, this.title, this.desc, this.isButton);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            imagePath,
            width: 270,
            height: 270,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.5),
            child: Container(
              height: 261,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(82, 150, 214, 0.24),
                      blurRadius: 50,
                      spreadRadius: -11,
                      offset: Offset(1, 1), // Shadow position
                    ),
                  ]),
              child: Column(
                children: [
                  verticalSpace(41),
                  Text(
                    title,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 24),
                  ),
                  verticalSpace(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      desc,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.w300, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
