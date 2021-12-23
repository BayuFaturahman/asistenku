import 'package:AsistenKu/shared/constants/constants.dart';
import 'package:AsistenKu/shared/constants/data.dart';
import 'package:AsistenKu/widget/card/card_bottom_sheet.dart';
import 'package:AsistenKu/widget/card/card_rounded.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetMenu {
  final BuildContext context;

  BottomSheetMenu(this.context);

  void displayBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.90,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 10),
              child: SizedBox(
                height: 5,
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
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Semua",
                style:
                    TextStyles.h5.copyWith(color: AppColor.bodyColor.shade700),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: menuitemAll.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: AppColor.bodyColor.shade200,
                                      width: 1.0))),
                          child: ListTile(
                            leading: Image.asset(
                              menuitemAll[i]['icon'],
                              width: 45,
                              height: 45,
                            ),
                            title: Text(menuitemAll[i]['label']),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
    //  Get.bottomSheet(
    //     Container(
    //       decoration: BoxDecoration(
    //         borderRadius: Corners.xlBorder,
    //         color: Colors.white,
    //       ),
    //       height: Get.height,
    //
    //       child: StatefulBuilder(
    //   builder: (ctx, setState) {
    //       return CardBottomsheet(
    //         child: SingleChildScrollView(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text("Semua Layanan",style: TextStyles.h5,),
    //               verticalSpace(25),
    //               ListView.builder(
    //                 itemCount: 10,
    //                   itemBuilder: (context, i){
    //                return ListTile(
    //                   leading: Image.asset(AppAssets.menuFullService,width: 45,height: 45,),
    //                  title: const Text("Full Service"),
    //                  trailing: const Icon(Icons.arrow_forward_ios,size: 16,),
    //                 );
    //               })
    //
    //             ],
    //           ),
    //         ),
    //       );
    //   },
    // ),
    //     ));
  }

  openBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading:const Icon(Icons.photo),
                title:const Text("Foto"),
                onTap:(){},
              ),
              ListTile(
                leading:const Icon(Icons.camera),
                title:const Text("Kamera"),
                onTap:(){},
              ),

            ],
          );
        });
  }

}
