import 'package:AsistenKu/nonLogged/loggin/api_login.dart';
import 'package:get/get.dart';

class ControllerUserLogin extends GetxController {
  RxBool isLoading = false.obs;

  RxInt statusCode = 0.obs;
  RxString phoneCode ="".obs;

  RxString nama ="".obs;
  RxString role ="".obs;

  RxMap dataUserInfo={}.obs;
  RxMap dataUser={}.obs;

  Future<dynamic> loginApps(
      {required String value,
      required String password,
      required int loginBy}) async {
    isLoading(true);
    try {
      isLoading(true);
      final result = await ApiLogin()
          .loginApps(value: value, password: password, loginBy: loginBy);
      print("value di controller : " + result['code'].toString());
      if (result['code'] == 200) {
        statusCode(result['code']);
        // nama("swswswsw");
        // print("nama di controller : "+ result['data']['name']);
        // role.value == result['data']['user']['role'];
        isLoading(false);
        return result;
      } else {
        isLoading(false);

        return result;
      }
    } catch (e) {
      isLoading(false);
      rethrow;
    }
  }
}
