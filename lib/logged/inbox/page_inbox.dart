import 'package:asistenku/logged/inbox/controller_inbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertsPage extends GetView<ControllerInbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        child: Center(
          child: Text(
            "Alerts Page",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}