import 'dart:async';

import 'package:asistenku/nonLogged/register/controller_register.dart';
import 'package:asistenku/shared/constants/constants.dart';
import 'package:asistenku/shared/constants/styles.dart';
import 'package:asistenku/widget/button_icon_horizontal.dart';
import 'package:asistenku/widget/inpu_primary.dart';
import 'package:asistenku/widget/pages/location_maps/controller_maps.dart';
import 'package:asistenku/widget/pages/page_decoration_top.dart';
import 'package:asistenku/widget/pages/page_maps.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';


class PageCourierSearch extends StatefulWidget {
  final String? title;
  final bool? aturLokasi;

  const PageCourierSearch({Key? key, this.title, this.aturLokasi})
      : super(key: key);

  @override
  State<PageCourierSearch> createState() => _PageCourierSearchState();
}

class _PageCourierSearchState extends State<PageCourierSearch> {
  final ControllerMaps cRegister = Get.find<ControllerMaps>();
  final TextEditingController _searchC = TextEditingController();
  List<Map<String, dynamic>> predictions = [];
  bool loading = false;
  Timer? t;

  void loadingOn() => setState(() {
    loading = true;
  });

  void loadingOff() => setState(() {
    loading = false;
  });

  @override
  void dispose() {
    super.dispose();
    t?.cancel();
  }

  Future<void> autoCompletedPredictions(String query) async {
    predictions.clear();
    if (null != t) {
      t?.cancel();
    }

    t = Timer(const Duration(microseconds: 2000), () async {
      loadingOn();
      try {
        print(_searchC.text);
        final locations =
        await locationFromAddress(_searchC.text, localeIdentifier: "id_ID")
            .then((value) async {
          print("value : " + value.toString());
          if (value.isNotEmpty) {
            for (var i = 0; i < value.length; i++) {
              final location = value[i];
              List<Placemark> placemarks = await placemarkFromCoordinates(
                location.latitude,
                location.longitude,
              );
              for (var j = 0; j < placemarks.length; j++) {
                final placemark = placemarks[j].toJson();
                placemark['latitude'] = location.latitude;
                placemark['longitude'] = location.longitude;
                predictions.add(placemark);
                print(predictions.toString());
              }
            }
          }
        });

        loadingOff();
      } catch (e) {
        loadingOff();
        predictions = [
          {
            "name": "",
            "street": "Alamat tidak ditemukan",
            "isoCountryCode": "",
            "country": "",
            "postalCode": "",
            "administrativeArea": "",
            "subAdministrativeArea": '',
            'locality': '',
            'subLocality': '',
            'thoroughfare': '',
            'subThoroughfare': '',
            'latitude': '',
            'longitude': ''
          }
        ];
        print('error: Failed to get address :' + e.toString());
      }
    });
    print(predictions.toString());
  }

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
        padding: const EdgeInsets.all(0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Sizes.xs,
                width: Get.width,
                color: AppColor.bodyColor.shade100,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Insets.xl),
                child: InputPrimary(
                  onChange: (v) {
                    if (v.length >= 3) autoCompletedPredictions(v);
                  },
                  controller: _searchC,
                  hintText: "Cari nama jalan, gedung, dll",
                  label: 'Your Location',
                  prefixIcon:  Icon(Icons.location_on,color: Colors.blueAccent,size:IconSizes.sm),

                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Insets.sm),
                child: ButtonIconHorizontal(
                    // icon: Icons.map,
                    text: "Atur lokasi dengan peta",
                    textStyle: TextStyles.small1.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColor.secondColor.shade400),
                    onTap: () async {
                      predictions.clear();
                      if (widget.aturLokasi != null) {
                        var data = await Get.to(() => const PageMap());
                        if (data != null) {
                          print("hasil kembali != null" + data.toString());
                          setState(() {
                            _searchC.text = data['subLocality'] +
                                ", " +
                                data['locality'] +
                                ", " +
                                data['subAdministrativeArea'] +
                                ", " +
                                data['postalCode'];
                            predictions.add(data);
                          });
                        }
                      } else {
                        Get.back();
                      }
                    }),
              ),
              Container(
                height: Sizes.xs,
                width: Get.width,
                color: AppColor.bodyColor.shade100,
              ),
              verticalSpace(Insets.lg),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Insets.xl),
                child: Text(
                  _searchC.text.isNotEmpty ? "Hasil Pencarian" : "",
                  style: TextStyles.subtitle2
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              verticalSpace(Insets.lg),
              buildPredictions(),
              verticalSpace(Insets.xl)
            ],
          ),
        ),
        title: widget.title ?? "Antar ke...");
  }

  Widget buildPredictions() {
    return loading
        ? const Center(
      child: CircularProgressIndicator(),
    )
        : Column(
      children: predictions
          .map((e) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Insets.xl),
            child: CardSavedAdress(
                label: "${e['street']}",
                adress:
                "${e['subLocality']}  ${e['locality']}  ${e['subAdministrativeArea']} ${e['postalCode']} ${e['administrativeArea']}",
                onTap: () {
                  if (e['locality'].isNotEmpty) {
                    print(cRegister.isOrigin.value.toString());
                    if (cRegister.isOrigin.value) {
                      cRegister.originAddress.value = e['street'];
                      cRegister.originKecamatan.value =
                      e['locality'];
                      cRegister.originKelurahan.value =
                      e['subLocality'];
                      cRegister.originKota.value =
                      e['subAdministrativeArea'];
                      cRegister.originKodePos.value =
                      e['postalCode'];
                      cRegister.originProvinsi.value =
                      e['administrativeArea'];
                      cRegister.originLatitude.value =
                      e['latitude'];
                      cRegister.originLongitude.value =
                      e['longitude'];
                    }
                    print("TESS 1" + e['postalCode']);
                    Get.back(result: {
                      "latitude": e['latitude'],
                      "longitude": e['longitude']
                    });
                  } else {
                    Get.back();
                  }
                }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Insets.xl),
            child: Divider(
              height: Insets.xxl,
            ),
          ),
        ],
      ))
          .toList(),
    );
  }

  Column savedAdress() {
    return Column(
      children: [
        verticalSpace(Insets.lg),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Insets.xl),
          child: CardSavedAdress(
              onTap: () {
                if (cRegister.isOrigin.value) {
                  cRegister.originLabel.value = "Rumah";
                  cRegister.originAddress.value =
                  "Komplek Bumi Sukagalih Permai B1 no.44, Sangkanhurip, Kec. Katapang, Bandung, Jawa Barat 40921";
                }
                Get.back();
              },
              label: "Rumah",
              adress:
              "Komplek Bumi Sukagalih Permai B1 no.44, Sangkanhurip, Kec. Katapang, Bandung, Jawa Barat 40921"),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Insets.xl),
          child: Divider(
            height: Insets.xxl,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Insets.xl),
          child: CardSavedAdress(
              onTap: () {
                if (cRegister.isOrigin.value) {
                  cRegister.originLabel.value = "Mamah";
                  cRegister.originAddress.value =
                  "Komplek Cingcin Permata Indah Blok G 216B, Cingcin, Kec. Katapang, Bandung, Jawa Barat 40915";
                }
                Get.back();
              },
              label: "Mamah",
              adress:
              "Komplek Cingcin Permata Indah Blok G 216B, Cingcin, Kec. Katapang, Bandung, Jawa Barat 40915"),
        ),
      ],
    );
  }
}

class CardSavedAdress extends StatelessWidget {
  const CardSavedAdress(
      {Key? key, this.label, required this.adress, required this.onTap})
      : super(key: key);

  final String? label;
  final String adress;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.location_on,
            color: AppColor.bodyColor.shade500,
            size: IconSizes.med,
          ),
          horizontalSpace(4),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  label == null
                      ? const SizedBox()
                      : Text(
                    label!,
                    style: TextStyles.small1
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    adress.trimLeft(),
                    style: TextStyles.small1,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
