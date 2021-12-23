import 'package:AsistenKu/logged/home/controller_home.dart';
import 'package:AsistenKu/logged/home/notifikasi/page_notifikasi.dart';
import 'package:AsistenKu/logged/home/page_all_worker.dart';
import 'package:AsistenKu/nonLogged/loggin/controller_user_login.dart';
import 'package:AsistenKu/shared/constants/constants.dart';
import 'package:AsistenKu/shared/constants/data.dart';
import 'package:AsistenKu/shared/constants/styles.dart';
import 'package:AsistenKu/widget/bottomsheet/bottomsheet_menu.dart';
import 'package:AsistenKu/widget/button_primary.dart';
import 'package:AsistenKu/widget/other/show_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends GetView<ControllerHome> {
  final double lat;
  final double long;
  final String addres;
  final dataUser;

  HomePage(
    this.lat,
    this.long,
    this.dataUser,
    this.addres, {
    Key? key,
  }) : super(key: key);

  final CarouselController _controller = CarouselController();
  final ControllerHome cHome = Get.find<ControllerHome>();
  final ControllerUserLogin cUser = Get.find<ControllerUserLogin>();

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            width: 350,
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    // print("data dettail : "  + cUser.dataUserInfo.value.toString());
    // print("data doang : "  + cUser.dataUser.value.toString());
    return Scaffold(
        body: SafeArea(
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          SizedBox(
            height:1110,
            child: Stack(
              children: [
                Image.asset(
                  AppAssets.imageCardHome,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 45),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            "assets/images/profile1.png",
                            width: IconSizes.xxl,
                          ),
                        ],
                      ),
                      horizontalSpace(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              horizontalSpace(2),
                              Text(
                                dataUser['name'],
                                style: TextStyles.h5.copyWith(
                                  color: AppColor.whiteColor,
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 3, top: 5),
                                child: Icon(
                                  Icons.location_on,
                                  size: 15,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                child: Text(addres,
                                    style: TextStyles.subtitle3.copyWith(
                                      color: AppColor.whiteColor,
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          verticalSpace(10),
                          InkWell(
                            onTap: () {
                              Get.to(() => PageNotfikasi());
                            },
                            child: Image.asset(
                              AppAssets.icNotif,
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 130),
                  child: Column(
                    children: [
                      CarouselSlider(
                        items: imageSliders,
                        carouselController: _controller,
                        options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            aspectRatio: 2.0,
                            height: 150,
                            onPageChanged: (index, reason) {
                              cHome.indicator(index);
                            }),
                      ),
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: imgList.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => _controller.animateToPage(entry.key),
                              child: Container(
                                width: 10.0,
                                height: 10.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 4.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? AppColor.whiteColor
                                            : AppColor.successColor)
                                        .withOpacity(
                                            cHome.indicator.value == entry.key
                                                ? 0.9
                                                : 0.4)),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 17,),
                        child: Row(
                          children: [
                            Text(
                              "Kategori Layanan",
                              style: TextStyles.h6
                                  .copyWith(color: AppColor.bodyColor),
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 370, left: 17, right: 17),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: menuitem.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            switch (index) {
                              case 0:
                                Get.dialog(Dialog(
                                  backgroundColor: Colors.transparent,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                AppAssets.imageBgPermision),
                                            fit: BoxFit.cover),
                                        borderRadius: Corners.xlBorder,
                                        color: Colors.white),
                                    child: Padding(
                                      padding: EdgeInsets.all(Insets.lg),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(AppAssets.logoUtama,
                                                width: 60, height: 60),
                                            verticalSpace(33),
                                            Image.asset(
                                                AppAssets.imageDescPermision,
                                                width: 305,
                                                height: 273),
                                            verticalSpace(35),
                                            Row(
                                              children: [
                                                Text(
                                                  "Hormat Kami,",
                                                  style: TextStyles.body1
                                                      .copyWith(
                                                          color: AppColor
                                                              .bodyColor
                                                              .shade700),
                                                ),
                                              ],
                                            ),
                                            verticalSpace(30),
                                            Row(
                                              children: [
                                                Text("Pengelola AsistenKu",
                                                    style: TextStyles.body1
                                                        .copyWith(
                                                            color: AppColor
                                                                .bodyColor
                                                                .shade700)),
                                              ],
                                            ),
                                            verticalSpace(42),
                                            ButtonPrimary(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              label: "Mengerti",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ));
                                break;
                              case 1:
                                showPopUp(
                                    imageUri: AppAssets.menuIroningWash,
                                    description: "Mohon maap fitur ini masih dalam tahap development",
                                    onPress: (){
                                      Get.back();
                                    }
                                );
                                break;
                              case 2:
                                showPopUp(
                                    imageUri: AppAssets.menuClean,
                                    description: "Mohon maap fitur ini masih dalam tahap development",
                                    onPress: (){
                                      Get.back();
                                    }
                                );
                                break;
                              case 3:
                                showPopUp(
                                    imageUri: AppAssets.menuBabySister,
                                    description: "Mohon maap fitur ini masih dalam tahap development",
                                    onPress: (){
                                      Get.back();
                                    }
                                );
                                break;
                              case 4:
                                showPopUp(
                                    imageUri: AppAssets.menuNurseParent,
                                    description: "Mohon maap fitur ini masih dalam tahap development",
                                    onPress: (){
                                      Get.back();
                                    });
                                break;
                              case 5:
                                BottomSheetMenu(context).displayBottomSheet();
                                break;
                            }
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 94,
                                width: 110,
                                decoration: BoxDecoration(
                                    color: AppColor.whiteColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, left: 20, right: 20),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        menuitem[index]['icon'],
                                        width: 45,
                                        height: 45,
                                      ),
                                      verticalSpace(10),
                                      Text(
                                        menuitem[index]['label'],
                                        style: TextStyles.callout2.copyWith(
                                            color: AppColor.bodyColor),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 600,left: 17,right: 17
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: (){
                            showPopUp(
                              imageUri: AppAssets.menuPeduli,
                              description: "Mohon maap fitur ini masih dalam tahap development",
                              onPress: (){
                                Get.back();
                              }
                            );

                          },
                          child: Container(
                            height:60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.primaryColor.withOpacity(0.3)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(AppAssets.menuPeduli,width: 30,height: 30,),
                                      horizontalSpace(16),
                                      Text(
                                        "Check in PeduliLindungi",
                                        style:
                                        TextStyles.subtitle2.copyWith(color: AppColor.primaryColor),
                                      )
                                    ],
                                  ),
                                  Image.asset(AppAssets.icBack,color: AppColor.primaryColor,width: 10,)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 17.0,vertical: 10
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Update Pengetahuan Anda",
                              style: TextStyles.h6
                                  .copyWith(color: AppColor.bodyColor.shade700),
                            ),
                            InkWell(
                              onTap: (){
                                showPopUp(
                                    imageUri: AppAssets.imageEror,
                                    description: "Mohon maap fitur ini masih dalam tahap development",
                                    onPress: (){
                                  Get.back();
                                });
                              },
                              child: Text(
                                "Lihat Lainya",
                                style:
                                    TextStyles.body1.copyWith(color: AppColor.primaryColor),
                              ),
                            )
                          ],
                        ),
                      ),
                      verticalSpace(10),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Container(
                                height: 180,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        itemBerita[index]['title'],
                                        style: TextStyles.h6
                                            .copyWith(color: AppColor.whiteColor),
                                      ),
                                      verticalSpace(2),
                                      Text(
                                        itemBerita[index]['child'],
                                        style: TextStyles.body1
                                            .copyWith(color: AppColor.whiteColor),
                                      )
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        itemBerita[index]['image'],
                                      ),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            );
                          }),
                    ],
                  ),
                ),

              ],
            ),
          ),
          verticalSpace(5),

        ],
      ),
    ));
  }
}
