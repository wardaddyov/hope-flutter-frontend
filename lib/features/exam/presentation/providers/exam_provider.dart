import 'package:hope/features/exam/data/models/exam.dart';

class ExamProvider{
  static Exam? exam;

  static void setExam(Exam selectedExam)
  {
    exam = selectedExam;
  }

  static Exam? getExam()
  {
    return exam;
  }
}