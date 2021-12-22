import 'package:AsistenKu/nonLogged/register/api_register.dart';
import 'package:get/get.dart';

class ControllerRegister extends GetxController {
  RxBool isLoading = false.obs;
  RxBool insitution = false.obs;

  RxString tokenOtp = "".obs;
  RxString otp = "".obs;

  RxString phoneCustumer = "".obs;
  RxInt statusCode = 0.obs;

  Future<dynamic> registerUser(
      {required String name,
      required String phone,
      required String email,
      required String password,
      required String role}) async {
    isLoading(true);
    try {
      isLoading(true);
      var result = await ApiRegister()
          .registerCustumer(name, phone, email, password, role);
      print("value di controller : " + result.toString());
      statusCode(result['code']);

      if (result['code'] == 200) {
        tokenOtp(result['otp']['token']);
        phoneCustumer(result['data']['user']['phoneNumber']);
        otp(result['otp']['otp']);
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

  Future<dynamic> otpVerifikasi({
    required String phone,
    required String otp,
    required String token,
  }) async {
    isLoading(true);
    try {
      isLoading(true);
      final result = await ApiRegister()
          .otpVerifikasi(phone: phone, otp: otp, token: token);
      print("value di controller : " + result.toString());
      isLoading(false);
      return result;
    } catch (e) {
      isLoading(false);
      rethrow;
    }
  }
}
