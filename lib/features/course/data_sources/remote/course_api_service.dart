import 'dart:convert';

import 'package:hope/features/course/Dto/course_create_dto.dart';
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

  static Future<http.Response> postCourseRequest(CourseCreateDto courseCreateDto) {
    return http.post(
      Uri.parse('http://localhost:5182/api/Course'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
      },
      body: jsonEncode(<String, dynamic>{
        'name': courseCreateDto.name,
        'activation': courseCreateDto.activation,
        'semester': courseCreateDto.semester,
        'group': courseCreateDto.group
      }),
    );
  }

  static Future<http.Response> postEnrolmentsRequest(int courseId,  List<int> studentIds) {
    return http.post(
      Uri.parse('http://localhost:5182/api/Course/Enrolments/$courseId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
      },
      body: jsonEncode(studentIds),
    );
  }
}