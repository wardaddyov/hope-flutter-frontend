import 'dart:io';
import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/exam/data/exam.dart';
import 'package:hope/features/exam/data/exam_api_service.dart';
import 'package:hope/features/exam/data/exam_repository.dart';

class ExamRepositoryImpl implements ExamRepository{
  @override
  Future<DataState> createExam(Exam exam) async {
    final httpResponse = await ExamApiService.createExamRequest(exam);

    if (httpResponse.statusCode == HttpStatus.ok){
      return DataSuccess(httpResponse.body);
    } else {
      return DataFailed();
    }
  }

}