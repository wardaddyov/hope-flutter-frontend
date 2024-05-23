import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/course/data/Models/course.dart';
import 'package:hope/features/exam/data/models/exam.dart';

abstract interface class ExamRepository{
  Future<DataState> createExam(Exam exam);
  Future<DataState> getExam(Course course);
  /* Participants Section */
  Future<DataState> getExamParticipants(Exam exam);
  Future<DataState> updateExamParticipants(Exam exam, List participants);
}