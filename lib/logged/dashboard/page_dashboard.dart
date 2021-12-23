import 'package:AsistenKu/logged/dashboard/controller_dashboard.dart';
import 'package:AsistenKu/logged/help/page_help.dart';
import 'package:AsistenKu/logged/home/page_home.dart';
import 'package:AsistenKu/logged/inbox/page_inbox.dart';
import 'package:AsistenKu/logged/other/page_other.dart';
import 'package:AsistenKu/logged/profile/page_profile.dart';
import 'package:AsistenKu/nonLogged/loggin/controller_user_login.dart';
import 'package:AsistenKu/shared/constants/assets.dart';
import 'package:AsistenKu/shared/constants/colors.dart';
import 'package:AsistenKu/shared/constants/styles.dart';
import 'package:AsistenKu/shared/controller/controller_binding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DashboardPage extends StatefulWidget {
  final dataUser;

  final double lat;
  final double long;
  final String addres;

  const DashboardPage(
      {Key? key,
      required this.lat,
      required this.long,
      this.dataUser,
      required this.addres})
      : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final ControllerDashboard cDashboard = Get.find<ControllerDashboard>();
  final ControllerUserLogin cUser = Get.find<ControllerUserLogin>();
  String kecamatan = '';
  String provinsi = '';

  @override
  void initState() {
    super.initState();
    // GetAddressFromLatLong(widget.lat, widget.long);
  }


  @override
  Widget build(BuildContext context) {
        return Obx(()=>Scaffold(
            body: SafeArea(
              child: IndexedStack(
                index: cDashboard.tabIndex.value,
                children: [
                  HomePage(
                      widget.lat, widget.long, widget.dataUser, widget.addres),
                  NewsPage(),
                  PageInbox(),
                  PageHelp(),
                  AccountPage(widget.dataUser),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: cDashboard.changeTabIndex,
              currentIndex: cDashboard.tabIndex.value,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color(0XFFEAF5FF),
              elevation: 0,
              items: [
                _bottomNavigationBarItem(
                  image: cDashboard.tabIndex.value == 0
                      ? AppAssets.icHomeActive
                      : AppAssets.icHomeNonActive,
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
                  image: cDashboard.tabIndex.value == 1
                      ? AppAssets.icOrderActive
                      : AppAssets.icOrderNonActive,
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
                  image: cDashboard.tabIndex.value == 2
                      ? AppAssets.icInboxActive
                      : AppAssets.icInboxNonActive,
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
                  image: cDashboard.tabIndex.value == 3
                      ? AppAssets.icHelpActive
                      : AppAssets.icHelpNonActive,
                  title: Text(
                    'Help',
                    style: TextStyle(
                        color: cDashboard.tabIndex.value == 3
                            ? AppColor.successColor
                            : AppColor.bodyColor[600],
                        fontWeight: cDashboard.tabIndex.value == 3
                            ? FontWeight.bold
                            : FontWeight.normal),
                  ),
                ),
                _bottomNavigationBarItem(
                  image: cDashboard.tabIndex.value == 4
                      ? AppAssets.icProfileActive
                      : AppAssets.icProfileNonActive,
                  title: Text(
                    'Profile',
                    style: TextStyle(
                        color: cDashboard.tabIndex.value == 4
                            ? AppColor.successColor
                            : AppColor.bodyColor[600],
                        fontWeight: cDashboard.tabIndex.value == 4
                            ? FontWeight.bold
                            : FontWeight.normal),
                  ),
                )
              ],
            ),
          ),
        );

  }

  _bottomNavigationBarItem({required String image, required Widget title}) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        image,
        width: 20,
        height: 30,
      ),
      title: title,
    );
  }
}
