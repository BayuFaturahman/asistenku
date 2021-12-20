import 'package:AsistenKu/shared/constants/colors.dart';
import 'package:AsistenKu/shared/constants/styles.dart';
import 'package:AsistenKu/widget/card/card_bottom_sheet.dart';
import 'package:AsistenKu/widget/input/inpu_primary.dart';
import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:get/get.dart';

import '../button_primary.dart';

class BottomSheetLocation {
  final BuildContext context;

  BottomSheetLocation(
      {required this.context,
      // required this.getxcontroller,
      required this.isOrigin,
      required this.onConfirm,
      this.location = ""});

  final bool isOrigin;
  final String location;
  // final ControllerCourier getxcontroller;
  final Function(
    String, //location,
    String, //locationDetail,
    bool, //asSender
    String, //name,
    String, //phoneNumber,
    String, //emailAddress,
  ) onConfirm;
  TextEditingController detailC = TextEditingController();
  TextEditingController namaC = TextEditingController();
  TextEditingController noHpC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  String name = "";
  String detailLocation = "";
  String phoneNumber = "";
  String emailAddress = "";
  bool asSender = false;

  bool isNext = false;
  bool isValidAdress = false;
  bool isValid = false;

  void _validateFormDetailAddress(void Function(void Function()) setState) {
    if (detailC.text.isNotEmpty && location.isNotEmpty) {
      setState(() => isValidAdress = true);
    } else {
      setState(() => isValidAdress = false);
    }
  }

  void _onNext(void Function(void Function()) setState) {
    setState(() => isNext = true);
  }

  Widget displayBottomSheet() {
    return StatefulBuilder(
      builder: (ctx, setState) {
        return CardBottomsheet(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //    "",
                //   style: TextStyles.subtitle2
                //       .copyWith(fontWeight: FontWeight.w700),
                // ),
                // Container(
                //   constraints: BoxConstraints(minHeight: Sizes.xl),
                //   color: AppColor.bodyColor.shade100,
                //   child: Row(
                //     children: [
                //       Icon(Icons.location_on,color: Colors.blueAccent,size:IconSizes.sm,),
                //       // Image.asset(
                //       //   App,
                //       //   width: IconSizes.sm,
                //       //   height: IconSizes.med,
                //       // ),
                //       horizontalSpace(Insets.sm),
                //       Expanded(
                //           child: Text(
                //             location.isNotEmpty ? location : "Lokasi..",
                //             style: TextStyles.small1,
                //           )),
                //     ],
                //   ),
                // ),
                Row(
                  children: [
                    Text(
                      "Lokasi Detail",
                      style: TextStyles.subtitle2
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "*",
                      style: TextStyles.subtitle2.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColor.secondColor.shade500),
                    ),
                  ],
                ),
                InputPrimary(
                  onChange: (v) {
                    detailLocation = v;
                    _validateFormDetailAddress(setState);
                  },
                  hintText: "Contoh : Jl. Semangka No.20 Blok B1 no.44",
                  controller: detailC,
                ),
                const Divider(),
                ButtonPrimary(
                  label: "Continue",
                  onPressed: () {
                    if (isValidAdress) {
                      // _onNext(setState);
                      Get.back();
                      Get.back();
                    }
                  },
                  enable: isValidAdress,
                ),
                verticalSpace(Insets.med)
              ],
            ),
          ),
        );
      },
    );
  }
}
