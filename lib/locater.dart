import 'package:get_it/get_it.dart';
import 'package:hope/features/course/data/Repository/course_repository.dart';
import 'package:hope/features/course/data/Repository/course_repository_impl.dart';
import 'package:hope/features/exam/data/repository/exam_repository.dart';
import 'package:hope/features/exam/data/repository/exam_repository_impl.dart';
import 'package:hope/features/student/data/repository/student_repository.dart';
import 'package:hope/features/student/data/repository/student_repository_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<StudentRepository>(StudentRepositoryImpl());
  getIt.registerSingleton<CourseRepository>(CourseRepositoryImpl());
  getIt.registerSingleton<ExamRepository>(ExamRepositoryImpl());
}