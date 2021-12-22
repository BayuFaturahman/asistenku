import 'package:get/get.dart';

class ControllerDashboard extends GetxController {
  RxInt tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex(index);
    update();
  }
}
