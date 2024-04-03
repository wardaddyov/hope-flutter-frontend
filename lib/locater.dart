import 'package:get_it/get_it.dart';
import 'package:hope/features/course/interfaces/course_repository.dart';
import 'package:hope/features/course/repository/course_repository_impl.dart';
import 'package:hope/features/student/interfaces/student_repository.dart';
import 'package:hope/features/student/repository/student_repository_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<StudentRepository>(StudentRepositoryImpl());
  getIt.registerSingleton<CourseRepository>(CourseRepositoryImpl());
}