import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/course/Dto/course_create_dto.dart';
import 'package:hope/features/course/model/course.dart';
import 'package:hope/features/student/models/student.dart';

abstract interface class CourseRepository{
  Future<DataState<List<Course>>> getCourses();
  Future<DataState<Course>> getCourse();
  Future<DataState<List<Student>>> getEnrolments(Course course);
  Future<DataState> createCourse(CourseCreateDto courseCreateDto);
  Future<DataState> createEnrolments(int courseId, List<Student> students);
  Future<DataState> updateCourse(Course updatedCourse);
  Future<DataState> updateEnrolments(int courseId, List<Student> students);
  Future<DataState> deleteCourse(Course course);

}