import 'dart:async';
import 'package:AsistenKu/widget/pages/location_maps/page_location_search.dart';
import 'package:AsistenKu/shared/constants/constants.dart';
import 'package:AsistenKu/widget/button_primary.dart';
import 'package:AsistenKu/widget/input/inpu_primary.dart';
import 'package:AsistenKu/widget/pages/page_decoration_top.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PageMap extends StatefulWidget {
  final bool isChange;
  const PageMap({Key? key, this.isChange = false}) : super(key: key);

  @override
  State<PageMap> createState() => _PageMapState();
}

class _PageMapState extends State<PageMap> {
  TextEditingController searchC = TextEditingController();
  PersistentBottomSheetController? _bottomSheetController;
  bool _showModal = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> mapController = Completer();
  Set<Marker> myMarker = {};
  Set<Marker> fakeMarker = {};
  double myLat = -6.905977;
  double myLong = 107.613144;
  late LatLng fakeLatLng;
  Map<String, dynamic> address = {};
  String tmp = '';

  void _showOrHide(bool show) {
    _showModal = show;
    if (_showModal) {
      _bottomSheetController = _scaffoldKey.currentState!.showBottomSheet(
        (_) => Container(
          constraints: BoxConstraints(
              maxHeight: Get.height * 0.4, minHeight: Get.height * 0.2),
          width: Get.width,
          padding:
              EdgeInsets.symmetric(vertical: Insets.sm, horizontal: Insets.xxl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints(minHeight: Sizes.xl),
                color: AppColor.bodyColor.shade100,
                padding: EdgeInsets.symmetric(horizontal: Insets.lg),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: IconSizes.sm,
                      color: Colors.green,
                    ),
                    horizontalSpace(Insets.sm),
                    Expanded(
                        child: Text(
                      tmp,
                      style: TextStyles.small1,
                    )),
                  ],
                ),
              ),
              verticalSpace(Insets.sm),
              ButtonPrimary(
                  onPressed: () {
                    Get.back();
                    Get.back(result: address);
                  },
                  label: "Pilih Alamat")
            ],
          ),
        ),
        backgroundColor: Colors.white,
      );
    } else {
      if (_bottomSheetController != null) _bottomSheetController!.close();
      _bottomSheetController = null;
    }
  }

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _getLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    myLat = position.latitude;
    myLong = position.longitude;

    await _addMarker(LatLng(myLat, myLong));
    setState(() {});
  }

  Future<void> _addMarker(LatLng pos) async {
    myMarker.add(Marker(
        draggable: true,
        onDragEnd: (newLatLong) {},
        markerId: const MarkerId("mymarker"),
        position: pos));

    //change camera
    final GoogleMapController gmc = await mapController.future;
    gmc.animateCamera(
        CameraUpdate.newCameraPosition(CameraPosition(target: pos, zoom: 19)));
  }

  Future<void> _setAddressFromMap(LatLng pos) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(pos.latitude, pos.longitude);
      Map<String, dynamic> lokasi = placemarks[0].toJson();
      for (var item in placemarks) {
        if (lokasi['postalCode'].isEmpty) {
          lokasi['postalCode'] = item.postalCode;
        }
      }
      print(pos.latitude.toString());
      print(pos.longitude.toString());
      address = lokasi;
      address['latitude'] = pos.latitude;
      address['longitude'] = pos.longitude;
      tmp = lokasi['subLocality'] +
          " " +
          lokasi['locality'] +
          " " +
          lokasi['subLocality'] +
          " " +
          lokasi['subAdministrativeArea'] +
          " " +
          lokasi['administrativeArea'] +
          " " +
          lokasi['postalCode'];

      _showOrHide(true);
    } catch (e) {
      print("error setaddress $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: PageDecorationTop(
          title: "Pilih Lokasi",
          iconBack: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.arrow_back,
                color: AppColor.bodyColor.shade500,
                size: IconSizes.lg,
              ),
              onPressed: () {
                Get.back();
              }),
          bottomBarHeight: Sizes.xl,
          bottomBar: GestureDetector(
            onVerticalDragStart: (details) {
              _showOrHide(true);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: AppColor.bodyColor.shade50,
                  borderRadius: BorderRadius.vertical(top: Corners.xlRadius)),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: Sizes.xs,
                  width: Sizes.xxl,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Corners.xl),
                      color: AppColor.bodyColor.shade400),
                ),
              ),
            ),
          ),
          padding: const EdgeInsets.all(0),
          child: Stack(
            children: [_showMap(), _searchField()],
          ),
        ),
      ),
    );
  }

  _getSearchLngLat() async {
    var data = await Get.to(() => const PageCourierSearch());
    if (data != null) {
      //change camera
      final GoogleMapController gmc = await mapController.future;
      gmc.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(data['latitude'], data['longitude']), zoom: 19)));
      setState(() {
        print("hasil kembali != null" + data.toString());
      });
    } else {
      //change camera
      final GoogleMapController gmc = await mapController.future;
      gmc.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(myLat, myLong), zoom: 19)));
      setState(() {
        print("hasil kembali != null" + data.toString());
      });
    }
    print("hasil kembali " + data.toString());
  }

  Align _searchField() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(left: Insets.xl, right: Sizes.xxl),
        child: InkWell(
          onTap: () {
            _getSearchLngLat();
          },
          child: InputPrimary(
              onChange: (v) {},
              controller: searchC,
              hintText: "Cari nama jalan, gedung, dll",
              enable: false,
              prefixIcon: Icon(
                Icons.location_on,
                color: Colors.green,
                size: IconSizes.sm,
              )),
        ),
      ),
    );
  }

  Widget _showMap() {
    return GoogleMap(
      onCameraIdle: () async {
        if (fakeMarker.isNotEmpty) {
          await _setAddressFromMap(fakeMarker.last.position);
          setState(() {
            myMarker = fakeMarker;
          });
        } else {
          await _setAddressFromMap(LatLng(myLat, myLong));
          setState(() {});
        }
      },
      onCameraMove: (cmr) {
        setState(() {
          _showOrHide(false);
          fakeMarker.add(Marker(
              onDragEnd: (newLatLong) {
                print("new : " + newLatLong.latitude.toString());
                print("new : " + newLatLong.longitude.toString());
              },
              draggable: true,
              markerId: const MarkerId("test"),
              position: cmr.target));
        });
      },
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      initialCameraPosition: CameraPosition(
          target: LatLng(
            myLat,
            myLong,
          ),
          zoom: 14),
      onMapCreated: (control) {
        mapController.complete(control);
      },
      markers: myMarker,
      onTap: (latlang) {
        setState(() {});
      },
    );
  }
}
