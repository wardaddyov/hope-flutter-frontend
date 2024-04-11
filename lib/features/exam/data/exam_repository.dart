import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/exam/data/exam.dart';

abstract interface class ExamRepository{
  Future<DataState> createExam(Exam exam);
}