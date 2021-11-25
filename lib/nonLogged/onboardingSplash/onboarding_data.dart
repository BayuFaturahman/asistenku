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
            width: 270,
            height: 270,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55.5),
            child: Row(
              children: [
                Text(
                  title,
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55.5),
            child: Text(
              desc,
              softWrap: true,
              textAlign: TextAlign.start,
              style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          widget.isButton == 'true'
              ? ButtonPrimary(
                  onPressed: () {
                    Get.offAll(() => PageLoggin());
                  },
                  label: 'Continue',
                  radius: 15,
                  size: 250,
                  labelStyle:const  TextStyle(fontSize: 21),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
