import 'package:AsistenKu/logged/home/notifikasi/page_detail_notif.dart';
import 'package:AsistenKu/shared/constants/assets.dart';
import 'package:AsistenKu/shared/constants/constants.dart';
import 'package:AsistenKu/widget/other/show_dialog.dart';
import 'package:AsistenKu/widget/pages/page_decoration_top.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageRiwayat extends StatefulWidget {
  const PageRiwayat({Key? key}) : super(key: key);

  @override
  State<PageRiwayat> createState() => _PageRiwayatState();
}

class _PageRiwayatState extends State<PageRiwayat> {
  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: 'Riwayat Pesanan',
      iconBack: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            size: 20,
            color: AppColor.bodyColor,
          )),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppAssets.menuClean,
                          width: 45,
                          height: 45,
                        ),
                        horizontalSpace(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cleaner",
                              style: TextStyles.subtitle1,
                            ),
                            Text(
                              "2020-12-22 14:20:20",
                              style: TextStyles.body1,
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Rp. 200.000", style: TextStyles.subtitle1),
                        Text("2 day",
                            style: TextStyles.subtitle1.copyWith(
                                color: AppColor.orangePrimary.shade300)),
                      ],
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
