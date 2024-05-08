import 'dart:convert';
import 'package:hope/features/exam/data/exam.dart';
import 'package:hope/features/exam/data/participant.dart';
import 'package:http/http.dart' as http;

class ExamApiService{
  static Future<http.Response> createExamRequest(Exam exam) {
    print(exam.toJson());
    return http.post(
      Uri.parse('http://localhost:5182/api/exam'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
      },
      body: jsonEncode(exam.toJson()),
    );
  }

  static Future<http.Response> getExamsRequest(int courseId) {
    return http.get(
      Uri.parse('http://localhost:5182/api/Exam/course/$courseId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
      },
    );
  }

  /* Participants Section */
  static Future<http.Response> getExamParticipants(int examId) {
    return http.get(
      Uri.parse('http://localhost:5182/api/Exam/students/$examId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
      },
    );
  }

  static Future<http.Response> updateExamParticipants(int examId, List participants) {
    return http.put(
      Uri.parse('http://localhost:5182/api/Exam/scores/$examId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
      },

      body: json.encode(participants),
    );
  }
}