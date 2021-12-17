import 'package:asistenku/shared/constants/colors.dart';
import 'package:asistenku/shared/constants/constants.dart';
import 'package:asistenku/widget/button_primary.dart';
import 'package:asistenku/widget/input/input_form_icon.dart';
import 'package:asistenku/widget/pages/location_maps/controller_maps.dart';
import 'package:asistenku/widget/pages/location_maps/page_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class PageDetailOrder extends StatefulWidget {
  @override
  State<PageDetailOrder> createState() => _PageDetailOrderState();
}

class _PageDetailOrderState extends State<PageDetailOrder> {
  final Set<Marker> markers = new Set(); //ma
  final ControllerMaps cMaps = Get.find<ControllerMaps>();
  DateTime selectedDate = DateTime.now();

  Set<Marker> getmarkers() {
    LatLng selectedLocation = LatLng(-6.905977, 107.613144);

    markers.add(Marker(
      //add first marker
      markerId: MarkerId(selectedLocation.toString()),
      position: selectedLocation, //position of marker
      infoWindow: const InfoWindow(
        //popup info
        title: 'Lokasi Anda',
        snippet: '',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    return markers;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ButtonPrimary(onPressed: () {}, label: "Add Worker"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: AppColor.bodyColor[400],
                    ),
                  ),
                  Text(
                    "Detail Order",
                    style: TextStyles.h6.copyWith(color: AppColor.bodyColor),
                  ),
                  const SizedBox()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 17.0,
              ),
              child: Text(
                "Your Home Address",
                style: TextStyles.subtitle1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: Container(
                height: 150,
                child: GoogleMap(
                  mapType: MapType.normal,
                  markers: getmarkers(),
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(-6.905977, 107.613144),
                    zoom: 17,
                  ),
                ),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            verticalSpace(10),
            GestureDetector(
              onTap: () => Get.to(() => const PageLocation()),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Container(
                  height: 44,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => Row(
                            children: [
                              const Icon(Icons.location_on, color: Colors.grey),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                cMaps.originAddress.value,
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            verticalSpace(10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Add Schedule",
                style: TextStyles.subtitle1,
              ),
            ),
            verticalSpace(10),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Container(
                  height: 44,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.calendar_today, color: Colors.grey),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          DateFormat.d().format(selectedDate).toString() +
                              ' ' +
                              DateFormat.MMM().format(selectedDate).toString() +
                              ',' +
                              ' ' +
                              DateFormat.y().format(selectedDate).toString(),
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            verticalSpace(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Service Packages",
                style: TextStyles.subtitle1,
              ),
            ),
            Divider(
              height: 2.0,
              color: AppColor.bodyColor.shade500,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "2",
                        style: TextStyles.body1,
                      ),
                      horizontalSpace(5),
                      Text(
                        "Hour",
                        style: TextStyles.body1,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Rp. 200.000",
                        style: TextStyles.body1,
                      ),
                      horizontalSpace(5),
                      Image.asset(
                        'assets/icons/ic_radio_on.png',
                        width: 25,
                        height: 25,
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "4",
                        style: TextStyles.body1,
                      ),
                      horizontalSpace(5),
                      Text(
                        "Hour",
                        style: TextStyles.body1,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Rp. 200.000",
                        style: TextStyles.body1,
                      ),
                      horizontalSpace(5),
                      Image.asset(
                        'assets/icons/ic_radio_off.png',
                        width: 25,
                        height: 25,
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "8",
                        style: TextStyles.body1,
                      ),
                      horizontalSpace(5),
                      Text(
                        "Hour",
                        style: TextStyles.body1,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Rp. 200.000",
                        style: TextStyles.body1,
                      ),
                      horizontalSpace(5),
                      Image.asset(
                        'assets/icons/ic_radio_off.png',
                        width: 25,
                        height: 25,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
