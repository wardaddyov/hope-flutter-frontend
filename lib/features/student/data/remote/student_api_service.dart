
import 'dart:convert';

import 'package:hope/features/student/dto/student_create_dto.dart';
import 'package:hope/features/student/models/student.dart';
import 'package:http/http.dart' as http;

class StudentApiService{
  static Future<http.Response> getStudentsRequest() {
    return http.get(
      Uri.parse('http://localhost:5182/api/Student'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
      },
    );
  }

  static Future<http.Response> getStudentRequest(String studentId) {
    return http.get(
      Uri.parse('http://localhost:5182/api/Student/$studentId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
      },
    );
  }

  static Future<http.Response> addStudentRequest(StudentCreateDto student) {
    return http.post(
      Uri.parse('http://localhost:5182/api/student'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
      },
      body: jsonEncode(<String, dynamic>{
        "studentID": student.studentID,
        "firstname": student.firstname,
        "lastname": student.lastname,
        "entryYear": student.entryYear,
        "email": student.email,
        "phoneNumber": student.phoneNumber,
        "description": student.description
      }),
    );
  }

  static Future<http.Response> updateStudentRequest(Student student) {
    return http.put(
      Uri.parse('http://localhost:5182/api/student/${student.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
      },
      body: jsonEncode(<String, dynamic>{
        "id": student.id,
        "studentID": student.studentID,
        "firstname": student.firstname,
        "lastname": student.lastname,
        "entryYear": student.entryYear,
        "email": student.email,
        "phoneNumber": student.phoneNumber,
        "description": student.description
      }),
    );
  }

  static Future<http.Response> deleteStudentRequest(int id) {
    return http.delete(
      Uri.parse('http://localhost:5182/api/student/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
      },
      body: jsonEncode(<String, dynamic>{
      }),
    );
  }
}