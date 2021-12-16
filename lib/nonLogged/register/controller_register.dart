import 'package:asistenku/nonLogged/register/api_register.dart';
import 'package:get/get.dart';

class ControllerRegister extends GetxController {
  RxBool isLoading = false.obs;
  RxBool insitution = false.obs;

  Future<dynamic> registerUser(
      {required String email,
      required String password,
      required String role}) async {
    isLoading(true);
    var response = await ApiRegister().registerUser(email, password, role);
    print("response : " + response.toString());
    isLoading(false);

    return response;
  }
}
