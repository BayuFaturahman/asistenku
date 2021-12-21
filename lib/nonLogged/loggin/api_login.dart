import 'dart:convert';

import 'package:AsistenKu/shared/constants/string.dart';
import 'package:http/http.dart' as http;

class ApiLogin {
  Future<dynamic> loginApps(
      {required String value,
        required String password,
      required int loginBy}) async {
    try {

      String url = MainUrls.urlApi + 'api/customer/login';

      final payloadEmail = <String, String>{
        "email":value,
        "password":password
      };

      final payloadPhone = <String, String>{
        "phoneNumber":value,
        "password":password
      };

      print("paload " + payloadEmail.toString() + payloadPhone.toString());
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          loginBy == 0 ? payloadEmail : payloadPhone
        ),
      );
      print("respone api : " + response.body.toString());
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        print("respone data: " + data.toString());

        return data;
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);

        return data;
      }
    } catch (e) {
      rethrow;
    }
  }
}