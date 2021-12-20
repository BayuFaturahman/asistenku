import 'package:AsistenKu/logged/home/page_detail_worker.dart';
import 'package:AsistenKu/shared/constants/colors.dart';
import 'package:AsistenKu/shared/constants/constants.dart';
import 'package:AsistenKu/widget/input/input_form_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class PageAllWorker extends StatefulWidget {
  @override
  State<PageAllWorker> createState() => _PageAllWorkerState();
}

class _PageAllWorkerState extends State<PageAllWorker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XffE5E5E5),
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Image.asset("assets/images/bg_header.png"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                        color: AppColor.bodyColor[400],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 20),
                  child: Row(
                    children: [
                      const InputFormIcon(
                        size: 300,
                        icon: Icon(Icons.search),
                        hintText: 'Search Your Worker...',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25, left: 10),
                        child: Image.asset(
                          "assets/icons/ic_filter.png",
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                "All Worker",
                style: TextStyles.h5,
              ),
            ),
            ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext, index) {
                return InkWell(
                  onTap: () => Get.to(() => PageDetailWorker()),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Container(
                      height: 130,
                      decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 90,
                              width: 90,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/profile1.png'))),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Testtt",
                                style: TextStyles.h6,
                              ),
                              Text(
                                "Cleaner",
                                style: TextStyles.body1,
                              ),
                              verticalSpace(10),
                              Padding(
                                padding: const EdgeInsets.only(left: 40),
                                child: RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 20,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 25, bottom: 25, left: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.location_on,
                                      color: Color(0XFF91C9D6),
                                    ),
                                    Text('0.5 km'),
                                  ],
                                ),
                                Container(
                                  height: 24,
                                  width: 44,
                                  child: const Center(child: Text('Open')),
                                  decoration: BoxDecoration(
                                    color: Color(0XFF91C9D6),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
