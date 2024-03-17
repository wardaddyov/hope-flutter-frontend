import 'dart:convert';

import 'package:http/http.dart';

class LoginApiService{
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
}