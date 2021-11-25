import 'package:asistenku/logged/profile/controller_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AccountPage extends GetView<AccountController> {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() => Text("Counter ${controller.counter.value}")),
              RaisedButton(
                child: Text("Increase"),
                onPressed: () => controller.increaseCounter(),
              )
            ],
          ),
        ),
      ),
    );
  }
}