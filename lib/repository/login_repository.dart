import 'dart:convert';
import 'package:hope/pages/login_page.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class LoginRepository {
  static late String token;

  static Future<Response> loginRequest(String username, String password) {
    return post(
      Uri.parse('http://localhost:5182/api/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
      },
      body: jsonEncode(<String, dynamic>{
        'username': username,
        'password': password
      }),
    );
  }

  static Future<bool> postData(String username, String password) async {

    var response = await loginRequest(username, password);
    if (response.statusCode == 200) {
      token = response.body;
      print(token);
      return true;
    } else {
      print('Error: ${response.statusCode}');
      return false;
    }
  }
}
