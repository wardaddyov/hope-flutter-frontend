import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hope/models/student.dart';
import 'package:http/http.dart';

class StudentRepository {

  static List<Student> students = [];

  static Future<http.Response> getStudentsRequest() async {
    final url = Uri.parse('http://localhost:5182/api/student');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      //'Authorization': 'Bearer ${LoginRepository.token}',
    });
    return response;
  }

  static Future<Response> addStudentRequest(Student student) {
    return post(
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
      }),
    );
  }

  static Future<Response> updateStudentRequest(Student student) {
    print(student.id);
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
      }),
    );
  }

  static Future<Response> deleteStudentRequest(Student student) {
    return http.delete(
      Uri.parse('http://localhost:5182/api/student/${student.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
      },
    );
  }

  static Future<List<Student>> convertJsonToStudent(List studentMap) async{
    for (Map student in studentMap) {
      Student userObj = Student(
          id: student['id'],
          studentID: student['studentID'],
          firstname: student['firstname'],
          lastname: student['lastname'],
          entryYear: student['entryYear'],
          password: '',
          username: '',
          email: '-',
          phoneNumber: '-');
      students.add(userObj);
    }

    return students;
  }

  static Future<bool> getStudents() async {

    var response = await getStudentsRequest();
    if (response.statusCode == 200) {
      await convertJsonToStudent(json.decode(response.body));
      return true;
    } else {
      print('Error: ${response.statusCode}');
      return false;
    }
  }

  static Future<bool> addStudent(Student student) async {

    var response = await addStudentRequest(student);
    if (response.statusCode == 200) {
      print("Student Added");
      return true;
    } else {
      print('Error: ${response.statusCode}');
      return false;
    }
  }
}
