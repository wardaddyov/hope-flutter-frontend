import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/course/model/course.dart';
import 'package:hope/features/exam/data/exam.dart';
import 'package:hope/features/exam/data/participant.dart';

abstract interface class ExamRepository{
  Future<DataState> createExam(Exam exam);
  Future<DataState> getExam(Course course);
  /* Participants Section */
  Future<DataState> getExamParticipants(Exam exam);
  Future<DataState> updateExamParticipants(Exam exam, List participants);
}