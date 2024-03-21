import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/course/model/course.dart';

abstract class CourseRepository{
  Future<DataState<List<Course>>> getCourses();
  Future<DataState<Course>> getCourse();
  Future<DataState> createCourse(Course course);
  Future<DataState> updateCourse(Course updatedCourse);
}