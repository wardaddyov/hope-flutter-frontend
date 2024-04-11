import 'dart:convert';
import 'package:hope/features/exam/data/exam.dart';
import 'package:http/http.dart' as http;

class ExamApiService{
  static Future<http.Response> createExamRequest(Exam exam) {
    return http.post(
      Uri.parse('http://localhost:5182/api/student'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
      },
      body: exam.toJson(),
    );
  }
}