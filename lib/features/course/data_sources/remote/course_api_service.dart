import 'dart:convert';

import 'package:http/http.dart' as http;


class CourseApiService{

  static Future<http.Response> getCoursesRequest() {
    return http.get(
      Uri.parse('http://localhost:5182/api/Course'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
      },
    );
  }
}