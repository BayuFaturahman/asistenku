import 'package:AsistenKu/logged/home/controller_home.dart';
import 'package:AsistenKu/logged/home/notifikasi/page_notifikasi.dart';
import 'package:AsistenKu/logged/home/page_all_worker.dart';
import 'package:AsistenKu/nonLogged/loggin/controller_user_login.dart';
import 'package:AsistenKu/shared/constants/constants.dart';
import 'package:AsistenKu/shared/constants/styles.dart';
import 'package:AsistenKu/widget/bottomsheet/bottomsheet_menu.dart';
import 'package:AsistenKu/widget/other/show_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final List<String> imgList = [
  AppAssets.imagePromo50,
  AppAssets.imagePromo50,
  AppAssets.imagePromo50
];

List item = [
  {"icon": AppAssets.menuFullService, "label": "Full Service"},
  {"icon": AppAssets.menuClean, "label": "Cleaning"},
  {"icon": AppAssets.menuBabySister, "label": "Babysitter"},
  {'icon': AppAssets.menuCareviger, 'label': 'Caregiver'},
  {'icon': AppAssets.menuNurseParent, 'label': 'Nurse Parent'},
  {'icon': AppAssets.menuSemua, 'label': 'Semua'},
];

List itemBerita = [
  {
    "image": AppAssets.imageBerita1,
    "title": "Pesona Bali 2021",
    "child" : "Lorem ipsum dolor sit amet",
    "desc":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dictumst ut habitasse ante lacus purus dolor. Porttitor viverra sit quam sed eleifend eu vulputate auctor. At vitae et duis ornare viverra. Fames molestie a,   diam a consequat, diam amet, molestie suscipit. Cursus sit id vestibulum quisque id sodales viverra tristique dictum. Aliquam sapien vulputate sed eget cras hac faucibus curabitur. Id odio vitae ut integer.."
  },
  {
    "image": AppAssets.imageBerita2,
    "title": "EUFA Euro 2020",
    "child" : "Lorem ipsum dolor sit amet",
    "desc":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dictumst ut habitasse ante lacus purus dolor. Porttitor viverra sit quam sed eleifend eu vulputate auctor. At vitae et duis ornare viverra. Fames molestie a,   diam a consequat, diam amet, molestie suscipit. Cursus sit id vestibulum quisque id sodales viverra tristique dictum. Aliquam sapien vulputate sed eget cras hac faucibus curabitur. Id odio vitae ut integer.."
  },
];

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
    return Scaffold(
        body: SafeArea(
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          SizedBox(
            height: Get.height / 1.1,
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
                              Get.to(()=>PageNotfikasi());
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 330, left: 17, right: 17, bottom: 10),
                  child: Text(
                    "Kategori Layanan",
                    style: TextStyles.body1
                        .copyWith(color: AppColor.bodyColor.shade700),
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
                      itemCount: item.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: (){
                            switch(index){
                              case 0:
                                showPopUpError(errorMessage: "Under Development");
                                break;
                              case 1:
                                showPopUpError(errorMessage: "Under Development");
                                break;
                              case 2:
                                showPopUpError(errorMessage: "Under Development");
                                break;
                              case 3:
                                showPopUpError(errorMessage: "Under Development");
                                break;
                              case 4:
                                showPopUpError(errorMessage: "Under Development");
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
                                        item[index]['icon'],
                                        width: 45,
                                        height: 45,
                                      ),
                                      verticalSpace(10),
                                      Text(
                                        item[index]['label'],
                                        style: TextStyles.small1.copyWith(
                                            color: AppColor.bodyColor[400]),
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

                // Padding(
                //   padding: const EdgeInsets.only(top: 300),
                //   child: Text("Your Location",style: TextStyles.h5,),
                // )
              ],
            ),
          ),
          verticalSpace(5),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 17.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Update Pengetahuan Anda",
                  style: TextStyles.h6
                      .copyWith(color: AppColor.bodyColor.shade700),
                ),
                Text(
                  "Lihat Lainya",
                  style:
                      TextStyles.body1.copyWith(color: AppColor.primaryColor),
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
                        image:  DecorationImage(
                          image: AssetImage(
                            itemBerita[index]['image'],
                          ),
                          fit: BoxFit.cover,
                        )),
                  ),
                );
              }),
          verticalSpace(20),
        ],
      ),
    ));
  }
}
