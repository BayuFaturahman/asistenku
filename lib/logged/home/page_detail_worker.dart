import 'package:asistenku/logged/home/page_detail_order.dart';
import 'package:asistenku/shared/constants/colors.dart';
import 'package:asistenku/shared/constants/constants.dart';
import 'package:asistenku/widget/button_primary.dart';
import 'package:asistenku/widget/input/input_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PageDetailWorker extends StatefulWidget {
  @override
  State<PageDetailWorker> createState() => _PageDetailWorkerState();
}

class _PageDetailWorkerState extends State<PageDetailWorker> {
  final Set<Marker> markers = new Set(); //ma

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ButtonPrimary(
            onPressed: () => Get.to(() => PageDetailOrder()),
            label: "Add Worker"),
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
                    "Detail Worker",
                    style: TextStyles.h6.copyWith(color: AppColor.bodyColor),
                  ),
                  const SizedBox()
                ],
              ),
            ),
            Container(
              height: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: AppColor.whiteColor),
              child: Card(
                  child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(25),
                      child: Image.asset(
                        "assets/images/profile1.png",
                        width: 90,
                        height: 90,
                      )),
                  Text(
                    "Setio Dwi",
                    style: TextStyles.h6,
                  ),
                  verticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Cleaner'),
                      horizontalSpace(10),
                      const Icon(
                        Icons.location_on,
                        color: Color(0XFF91C9D6),
                      ),
                      const Text('0.5 km'),
                      horizontalSpace(10),
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
                  verticalSpace(10),
                  RatingBar.builder(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 21.0, vertical: 10),
                    child: Text(
                      "adipiscing elit. Malesuada at ornare enim eu, pulvinar massa elementum. Sed risus laoreet auctor urna, phasellus ornare arcu, viverra. Vestibulum auctor ",
                      style: TextStyles.body2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 21.0,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/ic_call.png',
                              width: 16,
                              height: 27,
                            ),
                            horizontalSpace(10),
                            Text("+62 8836 1837 7611")
                          ],
                        ),
                        verticalSpace(10),
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/ic_pesan.png',
                              width: 16,
                              height: 27,
                            ),
                            horizontalSpace(10),
                            Text("baxe@gmail.com")
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 17.0,
              ),
              child: Text(
                "Worker Location",
                style: TextStyles.h6,
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
          ],
        ),
      ),
    );
  }
}
