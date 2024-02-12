import 'dart:convert';

import 'package:http/http.dart' as http;

class UserApiService {
  Future<dynamic> loginData(String username, String password) async {
    var client = http.Client();
    var apiUrl = Uri.parse("http://192.168.0.104:3001/api/register/login");

    var response = await client.post(apiUrl,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String, String>{
          "username": username,
          "password": password,
        })
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    else {
      throw Exception("failed to login");
    }
  }
  Future<dynamic> sendData(String username,String password, String dob,
      String email,String phone) async
  {
    var client = http.Client();
    var apiUrl = Uri.parse("http://192.168.0.104:3001/api/register/adduser");

    var response = await client.post(apiUrl,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String, String>{
          "username": username,
          "password": password,
          "dob": dob,
          "email": email,
          "phone": phone,
        })
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    else {
      throw Exception("failed to register");
    }
  }


}

