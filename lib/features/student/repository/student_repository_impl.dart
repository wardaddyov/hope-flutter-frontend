import 'dart:convert';
import 'dart:io';

import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/student/data/remote/student_api_service.dart';
import 'package:hope/features/student/dto/student_create_dto.dart';
import 'package:hope/features/student/interfaces/student_repository.dart';
import 'package:hope/features/student/models/student.dart';

class StudentRepositoryImpl implements StudentRepository{
  @override
  Future<DataState> createStudent(StudentCreateDto studentCreateDto) async {
    final httpResponse = await StudentApiService.addStudentRequest(studentCreateDto);
    print(httpResponse.body);
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