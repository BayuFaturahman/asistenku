import 'package:AsistenKu/logged/home/notifikasi/page_detail_notif.dart';
import 'package:AsistenKu/shared/constants/assets.dart';
import 'package:AsistenKu/shared/constants/constants.dart';
import 'package:AsistenKu/widget/other/show_dialog.dart';
import 'package:AsistenKu/widget/pages/page_decoration_top.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageNotfikasi extends StatefulWidget {
  const PageNotfikasi({Key? key}) : super(key: key);

  @override
  State<PageNotfikasi> createState() => _PageNotfikasiState();
}

class _PageNotfikasiState extends State<PageNotfikasi> {
  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: 'Notifikasi',
      toolbarAction: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: InkWell(
              onTap: () {
                showPopUpConfirm(
                    context: context,
                    desc: "Apakah yakin ingin menghapus semua notifikasi ?",
                    functionYes: () {});
              },
              child: Image.asset(AppAssets.icTrash, width: 15)),
        ),
      ],
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
              return InkWell(
                onTap: () {
                  Get.to(() => const PageDetailNotif());
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.logoUtama,
                        height: 40,
                        width: 40,
                      ),
                      horizontalSpace(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: Get.width * 0.75,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Order Berhasil",
                                      style: TextStyles.subtitle3,
                                    ),
                                    horizontalSpace(10),
                                    Container(
                                      height: 10,
                                      width: 10,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColor.errorColor),
                                    ),
                                  ],
                                ),
                                Text(
                                  "2020-12-22 14:20:20",
                                  style: TextStyles.subtitle3,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Anda telah berhasil order layanan Cleaning",
                            style: TextStyles.subtitle3
                                .copyWith(color: AppColor.bodyColor.shade400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
