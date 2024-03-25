import 'dart:convert';
import 'dart:io';

import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/student/data/remote/student_api_service.dart';
import 'package:hope/features/student/dto/student_create_dto.dart';
import 'package:hope/features/student/interfaces/student_repository.dart';
import 'package:hope/features/student/models/student.dart';

class StudentRepositoryImpl implements StudentRepository{
  @override
  Future<DataState> createStudent(StudentCreateDto studentCreateDto) {
    // TODO: implement createStudent
    throw UnimplementedError();
  }

  @override
  Future<DataState<Student>> getStudent() {
    // TODO: implement getCourse
    throw UnimplementedError();
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
  Future<DataState> updateStudent(StudentCreateDto studentCreateDto) {
    // TODO: implement updateStudent
    throw UnimplementedError();
  }

}