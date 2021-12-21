import 'dart:convert';

import 'package:AsistenKu/shared/constants/string.dart';
import 'package:http/http.dart' as http;

class ApiRegister {
  Future<dynamic> registerCustumer(
    String name,
    String phone,
    String email,
    String password,
    String role,
  ) async {
    try{
      String url = MainUrls.urlApi + 'api/customer/register';
      final payload = <String, String>{
        "name": name,
        "phoneNumber": phone,
        "email": email,
        "password": password,
        "role": role
      };
      print("payload : " + payload.toString());
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(payload),
      );
      print("respone api: " + response.body.toString());
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        print("respone data: " + data.toString());

        return data;
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);

        return data;
      }
    }catch(e){
      rethrow;
    }


  }

  Future<dynamic> otpVerifikasi(
      {required String phone,
      required String otp,
      required String token}) async {
    try {
      String url = MainUrls.urlApi + 'api/customer/verify-otp';

      final payload = <String, String>{
        "phoneNumber": phone,
        "otp": otp,
        "token": token,
      };
      print("payload : " + payload.toString());
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(payload),
      );
      print("respone api : " + response.body.toString());
      return response.body;
    } catch (e) {
      rethrow;
    }
  }
}
