import 'package:AsistenKu/logged/home/notifikasi/page_detail_notif.dart';
import 'package:AsistenKu/shared/constants/assets.dart';
import 'package:AsistenKu/shared/constants/constants.dart';
import 'package:AsistenKu/shared/helper/regex.dart';
import 'package:AsistenKu/widget/appbar/appbar.dart';
import 'package:AsistenKu/widget/button_primary.dart';
import 'package:AsistenKu/widget/input/input_primary_password.dart';
import 'package:AsistenKu/widget/other/show_dialog.dart';
import 'package:AsistenKu/widget/pages/page_decoration_top.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageSyarat extends StatefulWidget {
  const PageSyarat({Key? key}) : super(key: key);

  @override
  State<PageSyarat> createState() => _PageSyaratState();
}

class _PageSyaratState extends State<PageSyarat> {
  TextEditingController kataSandiLama = TextEditingController();
  TextEditingController kataSandiBaru = TextEditingController();
  TextEditingController kataSandiKonfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleSpacing: 80,
        leadingIcon: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            size: 25,
            color: AppColor.bodyColor,
          ),
        ),
        title: 'Syarat &  Ketentuan',
      ),
      backgroundColor: AppColor.whiteColor,
      body: Column(
        children: [
          verticalSpace(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                Image.asset(
                  AppAssets.logoUtama,
                  width: 50,
                  height: 50,
                ),
                horizontalSpace(30),
                Container(
                  width: 250,
                  child: Column(
                    children: [
                      Text(
                        "Kebijakan Privasi AsistenKu Desember 2021",
                        style: TextStyles.subtitle1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Container(
              child: Column(
                children: const [
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet non nec praesent ante a, aliquam eu proin. Aliquam, morbi turpis nisi mi tincidunt sed. Ultricies ut aenean enim dignissim sollicitudin nunc velit enim."),
                ],
              ),
            ),
          ),
          verticalSpace(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Container(
              child: Column(
                children: const [
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet non nec praesent ante a, aliquam eu proin. Aliquam, morbi turpis nisi mi tincidunt sed. Ultricies ut aenean enim dignissim sollicitudin nunc velit enim."),
                ],
              ),
            ),
          ),
          verticalSpace(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Container(
              child: Column(
                children: const [
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet non nec praesent ante a, aliquam eu proin. Aliquam, morbi turpis nisi mi tincidunt sed. Ultricies ut aenean enim dignissim sollicitudin nunc velit enim."),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
