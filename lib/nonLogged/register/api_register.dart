import 'dart:convert';

import 'package:http/http.dart' as http;


class ApiRegister{


  Future<dynamic>registerUser(
      String email,
      String password,
      String role,
      )async{
    String url = 'https://users';
    final payload=<String,String>{
      "email" : email,
      "password": password,
      "role" : role
    };
    final response = await http.post(
      Uri.parse(url),
      headers: <String,String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
        'Basic ZWNvbTowNTE0NGY0ZTEyYWFhNDAyYWViNTFlZjJjN2RkZTUyNw==',
      },
      body: jsonEncode(payload),
    );
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else {
      throw response.reasonPhrase.toString();
    }
  }
}