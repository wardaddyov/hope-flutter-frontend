import 'dart:convert';

import 'package:hope/features/course/data/Models/course_create_dto.dart';
import 'package:hope/features/course/data/Models/course.dart';
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

  static Future<http.Response> getEnrolmentRequest(courseId) {
    return http.get(
      Uri.parse('http://localhost:5182/api/Course/student/$courseId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
      },
    );
  }

  static Future<http.Response> postCourseRequest(CourseCreateDto courseCreateDto, List<int> ids) {
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
        'group': courseCreateDto.group,
        'studentIds': ids
      },),
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

  static Future<http.Response> deleteCourseRequest(int courseId) {
    return http.delete(
      Uri.parse('http://localhost:5182/api/Course/deleteCourse/$courseId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
      },
    );
  }

  static Future<http.Response> updateCourseRequest(Course updatedCourse, List<int> ids) {
    return http.put(
      Uri.parse('http://localhost:5182/api/Course/${updatedCourse.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
      },
      body: jsonEncode(<String, dynamic>{
        'id': updatedCourse.id,
        'name': updatedCourse.name,
        'activation': updatedCourse.activation,
        'semester': updatedCourse.semester,
        'group': updatedCourse.group,
        'studentIds': ids
      }),
    );
  }

  static Future<http.Response> updateEnrolmentsRequest(int courseId,  List<int> studentIds) {
    return http.put(
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