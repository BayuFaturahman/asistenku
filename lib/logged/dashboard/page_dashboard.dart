import 'package:asistenku/logged/dashboard/controller_dashboard.dart';
import 'package:asistenku/logged/home/page_home.dart';
import 'package:asistenku/logged/inbox/page_inbox.dart';
import 'package:asistenku/logged/other/page_other.dart';
import 'package:asistenku/logged/profile/page_profile.dart';
import 'package:asistenku/shared/constants/colors.dart';
import 'package:asistenku/shared/constants/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DashboardPage extends StatefulWidget {
  final double lat;
  final double long;
  const DashboardPage({Key? key, required this.lat, required this.long}) : super(key: key);


  @override
  State<DashboardPage> createState() => _DashboardPageState();
}


class _DashboardPageState extends State<DashboardPage> {
  final ControllerDashboard cDashboard = Get.find<ControllerDashboard>();



  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return GetBuilder<ControllerDashboard>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex.value,
              children: [
                HomePage(widget.lat,widget.long),
                NewsPage(),
                AlertsPage(),
                AccountPage(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: cDashboard.changeTabIndex,
            currentIndex: cDashboard.tabIndex.value,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor:const Color(0XFFEAF5FF),
            elevation: 0,
            items: [
          _bottomNavigationBarItem(
          image: "assets/icons/ic_home.png",
            title: Text(
              'Home',
              style: TextStyle(
                  color: cDashboard.tabIndex.value == 0
                      ? AppColor.successColor
                      : AppColor.bodyColor[600],
                  fontWeight: cDashboard.tabIndex.value == 0
                      ? FontWeight.bold
                      : FontWeight.normal),
            ),
          ),
          _bottomNavigationBarItem(
            image: "assets/icons/ic_order.png",
            title: Text(
              'Order',
              style: TextStyle(
                  color: cDashboard.tabIndex.value == 1
                      ? AppColor.successColor
                      : AppColor.bodyColor[600],
                  fontWeight: cDashboard.tabIndex.value == 1
                      ? FontWeight.bold
                      : FontWeight.normal),
            ),
          ),
          _bottomNavigationBarItem(
            image: "assets/icons/ic_inbox.png",

            title: Text(
              'Inbox',
              style: TextStyle(
                  color: cDashboard.tabIndex.value == 2
                      ? AppColor.successColor
                      : AppColor.bodyColor[600],
                  fontWeight: cDashboard.tabIndex.value == 2
                      ? FontWeight.bold
                      : FontWeight.normal),
            ),
          ),
          _bottomNavigationBarItem(
            image: "assets/icons/ic_person.png",

            title: Text(
              'Profile',
              style: TextStyle(
                  color: cDashboard.tabIndex.value == 2
                      ? AppColor.successColor
                      : AppColor.bodyColor[600],
                  fontWeight: cDashboard.tabIndex.value == 2
                      ? FontWeight.bold
                      : FontWeight.normal),
              ),)
            ],
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({required String image, required Widget title}) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        image,
        width: 20,
        height: 20,
      ),
      title: title,
    );
  }
}