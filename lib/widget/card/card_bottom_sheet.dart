import 'package:asistenku/widget/card/card_rounded.dart';
import 'package:asistenku/shared/constants/colors.dart';
import 'package:asistenku/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CardBottomsheet extends StatelessWidget {
  const CardBottomsheet({Key? key, required this.child, this.padding})
      : super(key: key);
  final Widget child;
  final EdgeInsets? padding;


  @override
  Widget build(BuildContext context) {


    return Container(
        padding: padding ??
            EdgeInsets.symmetric(vertical: 8 * scale, horizontal: 16 * scale),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16 * scale)),
            color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              top: 8 * scale,
              right: Get.width * 0.35,
              left: Get.width * 0.35,
              child: SizedBox(
                height: 4,
                child: CardRoundedBorder(
                  color: AppColor.bodyColor.shade200,
                  borderColor: AppColor.bodyColor.shade200,
                  child: Container(),
                  padding: EdgeInsets.all(Insets.xs),
                  shadow: Shadows.none,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Insets.med),
              child: child,
            )
          ],
        ));
  }
}
