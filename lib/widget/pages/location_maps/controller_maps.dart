import 'package:get/get.dart';

class ControllerMaps extends GetxController{
  RxString originLabel = "".obs;
  RxString originName = "".obs;
  RxString originPhone = "".obs;
  RxString originAddress = "Your Location".obs;
  RxString originKecamatan = "".obs;
  RxString originKelurahan = "".obs;
  RxString originKota = "".obs;
  RxString originProvinsi = "".obs;
  RxString originKodePos = "".obs;
  RxString originNegara = "".obs;
  RxString originEmailAddress = "".obs;
  RxDouble originLatitude = 0.0.obs;
  RxDouble originLongitude = 0.0.obs;
  RxBool isOrigin = false.obs;

}