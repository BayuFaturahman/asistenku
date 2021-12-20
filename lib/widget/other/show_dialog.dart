import 'package:AsistenKu/shared/constants/colors.dart';
import 'package:AsistenKu/shared/constants/styles.dart';
import 'package:AsistenKu/widget/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showPopUp(
    {String? title,
    String? description,
    String? labelButton,
    String? imageUri,
    double? imageSize,
    bool? dismissible,
    Function? onPress}) {
  Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: Corners.xlBorder, color: Colors.white),
          child: Padding(
            padding: EdgeInsets.all(Insets.lg),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    description ?? "",
                    style: TextStyles.body2
                        .copyWith(color: AppColor.bodyColor.shade500),
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(Insets.xxl),
                  imageUri != null
                      ? Image.asset(
                          imageUri,
                          height: imageSize ?? IconSizes.xxl,
                          width: imageSize ?? IconSizes.xxl,
                        )
                      : Container(),
                  verticalSpace(Insets.xl),
                  ButtonPrimary(
                    onPressed: () {
                      onPress != null ? onPress() : Get.back();
                    },
                    label: labelButton ?? "OK",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: dismissible ?? true);
}

showPopUpError(
    {Function? onError, Widget? toPage, required String errorMessage}) {
  if (onError != null) onError();
  showPopUp(
      title: "Ups! Ada Kesalahan",
      description: errorMessage,
      // imageUri: AppIllustrations.error,
      labelButton: "Kembali",
      onPress: () {
        (toPage != null) ? Get.offAll(toPage) : Get.back();
      });
}

Future<dynamic> showPopUpConfirm({
  required BuildContext context,
  required String desc,
  required Function() functionYes,
}) async {
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(Corners.med * 4))),
            titlePadding: const EdgeInsets.all(0),
            titleTextStyle: TextStyles.body1,
            contentPadding: EdgeInsets.all(Insets.lg),
            title: Container(
              padding: EdgeInsets.symmetric(
                  vertical: Insets.med, horizontal: Insets.xs * 2.5),
              child: Column(
                children: [
                  verticalSpace(Insets.med),
                  Text(
                    "Konfirmasi",
                    style: TextStyles.subtitle1.copyWith(color: Colors.black),
                  ),
                  verticalSpace(Insets.xxl),
                  Text(
                    desc,
                    textAlign: TextAlign.center,
                    style: TextStyles.body2
                        .copyWith(color: const Color(0xFF505050)),
                  )
                ],
              ),
            ),
            content: Row(
              children: [
                Expanded(
                  child: Container(
                      width: Get.width,
                      margin: EdgeInsets.only(right: Insets.xs),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: AppColor.primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(Corners.med * 2),
                      ),
                      child: TextButton(
                        onPressed: () => Get.back(),
                        child: Text("BATAL",
                            style: TextStyles.body2
                                .copyWith(fontWeight: FontWeight.w700)),
                      )),
                ),
                Expanded(
                  child: Container(
                      width: Get.width,
                      margin: EdgeInsets.only(left: Insets.xs),
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(Corners.med * 2),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                          functionYes();
                        },
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent)),
                        child: Text("YA",
                            style: TextStyles.body2.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColor.whiteColor)),
                      )),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

dialogConfirmation({
  String? title,
  String? desc1,
  String? desc2,
  String? desc3,
  String? label,
  Function? onPressed,
  bool? iconCancel,
}) {
  Get.dialog(
    Dialog(
      child: Container(
        padding: EdgeInsets.zero,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            (iconCancel == true)
                ? Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(
                        Icons.cancel,
                        color: Colors.grey,
                        size: 25,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  )
                : Container(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: SizedBox(
                width: double.infinity,
                child: Text(title ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyles.h1.apply(color: AppColor.primaryColor)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(desc1 ?? '',
                        textAlign: TextAlign.center, style: TextStyles.h4),
                    desc3 != null
                        ? Text(desc3,
                            textAlign: TextAlign.center,
                            style: TextStyles.body1
                                .copyWith(color: AppColor.primaryColor))
                        : Container(),
                    verticalSpace(Insets.lg),
                    Text(desc2 ?? '',
                        textAlign: TextAlign.center, style: TextStyles.body1),
                    verticalSpace(Insets.lg),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ButtonDangerOutline(
                        //   onPressed: () => Get.back(),
                        //   label: "Batal",
                        //   size: Get.width / 4,
                        // ),
                        horizontalSpace(Insets.lg),
                        ButtonPrimary(
                          onPressed: () => Get.back(),
                          label: "Ya",
                          size: Get.width / 4,
                        )
                      ],
                    ),
                    const SizedBox(height: 26)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}

Widget showError(
    {String? title,
    String? description,
    String? labelButton,
    Function()? onPress}) {
  return Padding(
    padding: EdgeInsets.all(Insets.lg),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title ?? "",
          style: TextStyles.h6,
          textAlign: TextAlign.center,
        ),
        verticalSpace(Insets.xxl),
        // Image.asset(
        //   AppIllustrations.error,
        //   height: Get.height * 0.25,
        // ),
        verticalSpace(Insets.xl),
        Text(
          description ?? "",
          style: TextStyles.body2,
          textAlign: TextAlign.center,
        ),
        verticalSpace(Insets.xl),
        ButtonPrimary(
          onPressed: () {
            onPress != null ? onPress() : Get.back();
          },
          label: labelButton ?? "OK",
        ),
      ],
    ),
  );
}

// showToast(
//     {required String message,
//     Color? color,
//     Color? textColor,
//     ToastGravity? gravity}) {
//   Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: gravity ?? ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: color ?? AppColor.primaryColor.shade200,
//       textColor: textColor ?? AppColor.bodyColor,
//       fontSize: 12);
// }

// showPopUpPasswordWeb(
//     {bool? dismissible,
//     required String passwordWeb,
//     required Function() copyPassword}) {
//   Get.dialog(
//       Dialog(
//         backgroundColor: Colors.transparent,
//         child: Container(
//           decoration: BoxDecoration(
//               borderRadius: Corners.lgBorder, color: Colors.white),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Image.asset(AppImages.imgPasswordWeb),
//                 verticalSpace(Insets.med),
//                 Text(
//                   'Generate Password Web',
//                   style: TextStyles.subtitle1,
//                   textAlign: TextAlign.center,
//                 ),
//                 verticalSpace(Insets.med),
//                 CardRounded(
//                   margin: EdgeInsets.symmetric(horizontal: Insets.xxl),
//                   color: AppColor.bodyColor.shade700,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           passwordWeb,
//                           style: TextStyles.subtitle1.copyWith(
//                               fontSize: FontSizes.s18,
//                               color: AppColor.whiteColor),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Get.back();
//                           copyPassword();
//                         },
//                         child: Image.asset(AppIcons.icCopyPasswordWeb,
//                             width: IconSizes.med),
//                       )
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: Insets.lg, vertical: Insets.med * 2),
//                   child: Column(
//                     children: [
//                       Text(
//                         "Gunakan email kamu dengan password tersebut untuk login di web PosAja!",
//                         style: TextStyles.body2,
//                         textAlign: TextAlign.center,
//                       ),
//                       verticalSpace(Insets.med * 2),
//                       Text(
//                         '(posaja.posindonesia.co.id)',
//                         style: TextStyles.subtitle1,
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(Insets.lg),
//                   child: ButtonPrimary(
//                     onPressed: () {
//                       Get.back();
//                     },
//                     label: "TUTUP",
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       barrierDismissible: dismissible ?? true);
// }
