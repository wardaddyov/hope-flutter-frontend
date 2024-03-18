import 'dart:convert';

import 'package:http/http.dart' as http;


class LoginApiService{

  static Future<http.Response> request(String username, String password) {
    return http.post(
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

}