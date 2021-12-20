import 'dart:async';

import 'package:AsistenKu/widget/bottomsheet/bottomsheet_location.dart';
import 'package:AsistenKu/nonLogged/register/controller_register.dart';
import 'package:AsistenKu/widget/pages/location_maps/controller_maps.dart';
import 'package:AsistenKu/widget/pages/location_maps/page_location_search.dart';
import 'package:AsistenKu/shared/constants/colors.dart';
import 'package:AsistenKu/shared/constants/constants.dart';
import 'package:AsistenKu/widget/input/inpu_primary.dart';
import 'package:AsistenKu/widget/pages/page_decoration_top.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PageLocation extends StatefulWidget {
  final bool isChange;
  const PageLocation({Key? key, this.isChange = false}) : super(key: key);

  @override
  State<PageLocation> createState() => _PageLocationState();
}

class _PageLocationState extends State<PageLocation> {
  final ControllerMaps cRegister = Get.find<ControllerMaps>();
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

  void _showOrHide(bool show) {
    _showModal = show;
    if (_showModal) {
      _bottomSheetController = _scaffoldKey.currentState!.showBottomSheet(
        (_) => BottomSheetLocation(
                onConfirm: (location, detailLocation, asSender, name,
                    phoneNumber, emailAddress) {
                  print(location);
                  print(detailLocation);
                  print(asSender.toString());
                  print(name);
                  print(phoneNumber);
                  print(emailAddress);

                  cRegister.originName.value = name;
                  cRegister.originAddress.value = detailLocation;
                  // _courierC.originDetailAddress.value = detailLocation;
                  // _courierC.originAsSender.value = asSender;
                  cRegister.originPhone.value = phoneNumber;
                  cRegister.originEmailAddress.value = emailAddress;

                  Get.back();
                  Get.back();
                },
                location: (cRegister.originKelurahan.value +
                    " " +
                    cRegister.originKecamatan.value +
                    " " +
                    cRegister.originKota.value +
                    " " +
                    cRegister.originKodePos.value +
                    " " +
                    cRegister.originProvinsi.value),
                context: context,
                isOrigin: cRegister.isOrigin.value)
            .displayBottomSheet(),
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
    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    //   show();
    // });
  }

  void _getLocation() async {
    if (!widget.isChange) {
      var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      myLat = position.latitude;
      myLong = position.longitude;
    } else {
      if (cRegister.isOrigin.value) {
        myLat = cRegister.originLatitude.value;
        myLong = cRegister.originLongitude.value;
      }
    }

    await _addMarker(LatLng(myLat, myLong));
    setState(() {});
    print("cetak lat: $myLat");
    print(myLong.toString());
  }

  Future<void> _addMarker(LatLng pos) async {
    print("addmarker");
    // await _setAddressFromMap(pos);

    myMarker.add(Marker(
        draggable: true,
        onDragEnd: (newLatLong) {
          print("new : " + newLatLong.latitude.toString());
          print("new : " + newLatLong.longitude.toString());
        },
        markerId: const MarkerId("mymarker"),
        infoWindow: InfoWindow(
            title:
                cRegister.isOrigin.value ? cRegister.originAddress.value : ""),
        icon: BitmapDescriptor.defaultMarkerWithHue(cRegister.isOrigin.value
            ? BitmapDescriptor.hueBlue
            : BitmapDescriptor.hueOrange),
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
        print(item.toString());

        if (lokasi['postalCode'].isEmpty) {
          lokasi['postalCode'] = item.postalCode;
        }

        print("MAsukkkkkkkk");
      }

      cRegister.originAddress.value = lokasi['street'];
      cRegister.originKelurahan.value = lokasi['subLocality'];
      cRegister.originKecamatan.value = lokasi['locality'];
      cRegister.originKota.value = lokasi['subAdministrativeArea'];
      cRegister.originProvinsi.value = lokasi['administrativeArea'];
      cRegister.originKodePos.value = lokasi['postalCode'];
      cRegister.originNegara.value = lokasi['country'];
      cRegister.originLatitude.value = pos.latitude;
      cRegister.originLongitude.value = pos.longitude;
      setState(() {});
      print("hasil alamat " + cRegister.originAddress.value);

      _showOrHide(true);

      // if (Get.isBottomSheetOpen!) {
      // } else {
      //   show();
      // }
    } catch (e) {
      print("error setaddress $e");
    }
  }

  void _clearController() {
    if (cRegister.isOrigin.value) {
      if (cRegister.originName.value == "") {
        cRegister.originAddress.value = "";
        // _courierC.originDetailAddress.value = "";
        cRegister.originKelurahan.value = "";
        cRegister.originKecamatan.value = "";
        cRegister.originKota.value = "";
        cRegister.originProvinsi.value = "";
        cRegister.originKodePos.value = "";
        cRegister.originNegara.value = "";
        // _courierC.originAsSender.value = asSender;
        cRegister.originPhone.value = "";
        cRegister.originEmailAddress.value = "";
        print(cRegister.originName.value);
        print(cRegister.originAddress.value);
        print("true");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _clearController();
        Get.back();
        return true;
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: PageDecorationTop(
          title: "Search your location",
          iconBack: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.arrow_back,
                color: AppColor.bodyColor.shade500,
                size: IconSizes.lg,
              ),
              onPressed: () {
                _clearController();
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
    var data = await Get.to(() => const PageCourierSearch(
          title: 'Search Location',
        ));
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
            prefixIcon: const Icon(
              Icons.location_on,
              color: Colors.blueAccent,
            ),
          ),
        ),
      ),
    );
  }

  Widget _showMap() {
    return GoogleMap(
      onCameraIdle: () async {
        if (fakeMarker.isNotEmpty) {
          print(fakeMarker.length.toString());
          print(fakeMarker.last.toString());
          print(fakeMarker.isEmpty.toString());
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
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  cRegister.isOrigin.value
                      ? BitmapDescriptor.hueGreen
                      : BitmapDescriptor.hueOrange),
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
