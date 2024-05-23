import 'dart:convert';
import 'dart:io';

import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/student/data/student_api_service.dart';
import 'package:hope/features/student/data/models/student_create_dto.dart';
import 'package:hope/features/student/data/repository/student_repository.dart';
import 'package:hope/features/student/data/models/student.dart';

class StudentRepositoryImpl implements StudentRepository{
  @override
  Future<DataState> createStudent(StudentCreateDto studentCreateDto) async {
    final httpResponse = await StudentApiService.addStudentRequest(studentCreateDto);
    if (httpResponse.statusCode == HttpStatus.ok){
      return DataSuccess(httpResponse.body);
    } else {
    return DataFailed();
    }
  }

  @override
  Future<DataState<Student>> getStudent(String studentId) async {

    final httpResponse = await StudentApiService.getStudentRequest(studentId);

    if (httpResponse.statusCode == HttpStatus.ok){
      final studentMap = json.decode(httpResponse.body);

      return DataSuccess(Student.fromJson(studentMap));
    } else {
      return DataFailed();
    }
  }

  @override
  Future<DataState<List<Student>>> getStudents() async {
    final httpResponse = await StudentApiService.getStudentsRequest();

    if (httpResponse.statusCode == HttpStatus.ok){
      return DataSuccess(await Student.convertJsonToStudents(json.decode(httpResponse.body)));
    } else {
    return DataFailed();
    }
  }

  @override
  Future<DataState> updateStudent(Student updatedStudent) async {
    final httpResponse = await StudentApiService.updateStudentRequest(updatedStudent);

    if (httpResponse.statusCode == HttpStatus.ok){
      return DataSuccess(httpResponse.body);
    } else {
    return DataFailed();
    }
  }

  @override
  Future<DataState> deleteStudent(int id) async {
    final httpResponse = await StudentApiService.deleteStudentRequest(id);
    if (httpResponse.statusCode == HttpStatus.noContent){
      return DataSuccess(httpResponse.body);
    } else {
      return DataFailed();
    }
  }

}