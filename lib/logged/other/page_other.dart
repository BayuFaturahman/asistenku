import 'package:AsistenKu/logged/other/controller_other.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsPage extends GetView<ControllerNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "News Page",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
