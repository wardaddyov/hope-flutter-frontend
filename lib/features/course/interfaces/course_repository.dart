import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/course/Dto/course_create_dto.dart';
import 'package:hope/features/course/model/course.dart';
import 'package:hope/features/student/models/student.dart';

abstract class CourseRepository{
  Future<DataState<List<Course>>> getCourses();
  Future<DataState<Course>> getCourse();
  Future<DataState> createCourse(CourseCreateDto courseCreateDto);
  Future<DataState> createEnrolments(Course course, List<Student> students);
  Future<DataState> updateCourse(Course updatedCourse);
}