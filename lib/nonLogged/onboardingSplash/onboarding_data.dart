import 'package:asistenku/nonLogged/loggin/page_login.dart';
import 'package:asistenku/widget/button_primary.dart';
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
            width: 250,
            height: 250,
          ),
          const SizedBox(
            height: 12.0,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                softWrap: true,
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              desc,
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          widget.isButton == 'true'
              ? ButtonPrimary(
                  onPressed: () {
                    Get.offAll(() => PageLoggin());
                  },
                  label: 'Continue',
                  radius: 15,
                  size: 250,
                  labelStyle: TextStyle(fontSize: 24),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
