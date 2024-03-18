import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hope/pages/login_page.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;



class LoginRepository {
  static late String token;

  // static Future<http.Response> request(String username, String password) {
  //   return http.post(
  //     Uri.parse('https://localhost:5182/api/auth/login'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Accept': '*/*',
  //       'Accept-Encoding': 'gzip, deflate, br',
  //       'Connection': 'keep-alive',
  //     },
  //     body: jsonEncode(<String, dynamic>{
  //       'username': username,
  //       'password': password
  //     }),
  //   );
  // }

  static Future<Response> request(String username, String password) async {
    final dio = Dio();
    Response response;
    response = await dio.post('https://localhost:5182/api/auth/login', data: {'username': username, 'password': password});
    return response;
  }

  static Future<bool> postData(String username, String password) async {

    var response = await request(username, password);
    if (response.statusCode == 200) {
      token = response.data;
      print(token);
      return true;
    } else {
      print('Error: ${response.statusCode}');
      return false;
    }
  }
}
