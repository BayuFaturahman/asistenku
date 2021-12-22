import 'package:AsistenKu/logged/help/controller_help.dart';
import 'package:AsistenKu/logged/inbox/controller_inbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageHelp extends GetView<ControllerHelp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Help",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
