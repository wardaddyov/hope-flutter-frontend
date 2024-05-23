import 'dart:io';
import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/course/data/Models/course.dart';
import 'package:hope/features/exam/data/models/exam.dart';
import 'package:hope/features/exam/data/exam_api_service.dart';
import 'package:hope/features/exam/data/repository/exam_repository.dart';

class ExamRepositoryImpl implements ExamRepository{
  @override
  Future<DataState> createExam(Exam exam) async {
    try{
      final httpResponse = await ExamApiService.createExamRequest(exam);
      print(httpResponse.body);
      if (httpResponse.statusCode == HttpStatus.ok){
        return DataSuccess(httpResponse.body);
      } else {
        return DataFailed();
      }
    }
    catch (_){
      print(_.toString());
      rethrow;
    }
  }

  @override
  Future<DataState> getExam(Course course) async {
    try{
      final httpResponse = await ExamApiService.getExamsRequest(course.id!);
      print(httpResponse.body);
      if (httpResponse.statusCode == HttpStatus.ok){
        return DataSuccess(httpResponse.body);
      } else {
        return DataFailed();
      }
    }
    catch (_){
      print(_.toString());
      rethrow;
    }
  }

  @override
  Future<DataState> getExamParticipants(Exam exam) async {
    try{
      print("Exam Id => " + exam.id.toString());
      final httpResponse = await ExamApiService.getExamParticipants(exam.id);
      print("Server Response => " + httpResponse.body);
      if (httpResponse.statusCode == HttpStatus.ok){
        return DataSuccess(httpResponse.body);
      } else {
        return DataFailed();
      }
    }
    catch (_){
      print(_.toString());
      rethrow;
    }
  }

  @override
  Future<DataState> updateExamParticipants(Exam exam, List participants) async {
    try{
      final httpResponse = await ExamApiService.updateExamParticipants(exam.id, participants);
      print("Response =>" + httpResponse.body);
      if (httpResponse.statusCode == HttpStatus.ok){
        return DataSuccess(httpResponse.body);
      } else {
        return DataFailed();
      }
    }
    catch (_){
      print("Caught Error: " + _.toString());
      rethrow;
    }
  }
}