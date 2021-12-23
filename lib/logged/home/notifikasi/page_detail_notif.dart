import 'package:AsistenKu/shared/constants/assets.dart';
import 'package:AsistenKu/shared/constants/constants.dart';
import 'package:AsistenKu/widget/pages/page_decoration_top.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageDetailNotif extends StatefulWidget{
  const PageDetailNotif({Key? key}) : super(key: key);

  @override
  State<PageDetailNotif> createState() => _PageDetailNotifState();

}

class _PageDetailNotifState extends State<PageDetailNotif> {
  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: 'Detail',
      toolbarAction:  [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Image.asset(AppAssets.icTrash,width: 15),
        ),
      ],
      iconBack:InkWell(
          onTap: (){
            Get.back();
          },
          child:const  Icon(Icons.arrow_back,size: 20,color: AppColor.bodyColor,)),
      child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(AppAssets.logoUtama,height: 40,width: 40,),
                    horizontalSpace(20),
                    Text("Cleaner",style: TextStyles.subtitle2,),


                  ],
                ),
                Text("2020-12-22 14:20:20",style: TextStyles.subtitle2,),

              ],
            ),
          ),
          verticalSpace(10),
          Row(
            children: [
              horizontalSpace(50),
              Container(
                width: 260,
                child: Column(
                  children:  [
                    Row(
                      children:const  [
                        Text("Massa sem tincidunt pellentesque."),
                      ],
                    ),
                    verticalSpace(10),
                    Row(
                      children: [
                        SizedBox(
                          width: 260,
                          child: Column(
                            children:const [
                              Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet non nec praesent ante a, aliquam eu proin. Aliquam, morbi turpis nisi mi tincidunt sed. Ultricies ut aenean enim dignissim sollicitudin nunc velit enim."),
                            ],
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(10),

                    Row(
                      children: [
                        SizedBox(
                          width: 260,
                          child: Column(
                            children:const [
                              Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet non nec praesent ante a, aliquam eu proin. Aliquam, morbi turpis nisi mi tincidunt sed. Ultricies ut aenean enim dignissim sollicitudin nunc velit enim."),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )

        ],
      )
    );
  }

}