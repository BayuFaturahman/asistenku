import 'package:asistenku/shared/constants/colors.dart';
import 'package:asistenku/shared/constants/constants.dart';
import 'package:asistenku/widget/input_form_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class PageDetailWorker extends StatefulWidget {
  @override
  State<PageDetailWorker> createState() => _PageDetailWorkerState();
}

class _PageDetailWorkerState extends State<PageDetailWorker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: AppColor.bodyColor[400],
                  ),
                  Text(
                    "Detail Order",
                    style: TextStyles.h6.copyWith(color: AppColor.bodyColor),
                  ),
                  const SizedBox()
                ],
              ),
            ),
            Container(
              height: 425,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: AppColor.whiteColor),
              child: Card(child: Column(
                children: [
                  Container(
                    child: Image.asset("assets/"),

                  ),
                  const Text("pp"),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
