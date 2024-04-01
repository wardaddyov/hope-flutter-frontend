import 'dart:convert';
import 'dart:io';

import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/course/Dto/course_create_dto.dart';
import 'package:hope/features/course/data_sources/remote/course_api_service.dart';
import 'package:hope/features/course/interfaces/course_repository.dart';
import 'package:hope/features/course/model/course.dart';
import 'package:hope/features/course/presentation/provider/new_course_cache.dart';
import 'package:hope/features/student/models/student.dart';

class CourseRepositoryImpl implements CourseRepository{
  @override
  Future<DataState> createCourse(CourseCreateDto courseCreateDto) async {
    final httpResponse = await CourseApiService.postCourseRequest(courseCreateDto);
    print(httpResponse.body);
    if (httpResponse.statusCode == HttpStatus.ok){
      return DataSuccess(httpResponse.body);
    } else {
    return DataFailed();
    }
  }

  @override
  Future<DataState<Course>> getCourse() {
    // TODO: implement getCourse
    throw UnimplementedError();
  }

  @override
  Future<DataState<List<Course>>> getCourses() async{
    final httpResponse = await CourseApiService.getCoursesRequest();

    if (httpResponse.statusCode == HttpStatus.ok){
      return DataSuccess(await Course.convertJsonToCourses(json.decode(httpResponse.body)));
    } else {
      return DataFailed();
    }
  }

  @override
  Future<DataState> updateCourse(Course updatedCourse) async {
    final httpResponse = await CourseApiService.updateCourseRequest(updatedCourse);

    print(httpResponse.statusCode);

    if (httpResponse.statusCode == HttpStatus.ok){
      return DataSuccess(httpResponse.body);
    } else {
      return DataFailed();
    }
  }

  @override
  Future<DataState> createEnrolments(int courseId, List<Student> students) async {
    List<int> ids = [];
    for (Student student in students){
      ids.add(student.id!);
    }

    final httpResponse = await CourseApiService.postEnrolmentsRequest(courseId, ids);

    if (httpResponse.statusCode == HttpStatus.ok){
      return DataSuccess(httpResponse.body);
    } else {
    return DataFailed();
    }
  }

  @override
  Future<DataState> deleteCourse(Course course) async {
    final httpResponse = await CourseApiService.deleteCourseRequest(course.id!);
    if (httpResponse.statusCode == HttpStatus.noContent){
      return DataSuccess(httpResponse.body);
    } else {
    return DataFailed();
    }
  }

  @override
  Future<DataState<List<Student>>> getEnrolments(Course course) async {
    final httpResponse = await CourseApiService.getEnrolmentRequest(course.id);

    if (httpResponse.statusCode == HttpStatus.ok){
      return DataSuccess((await Student.convertJsonToStudents(json.decode(httpResponse.body))));
    } else {
    return DataFailed();
    }
  }

  @override
  Future<DataState> updateEnrolments(int courseId, List<Student> students) async {
    List<int> ids = [];
    for (Student student in students){
      ids.add(student.id!);
    }

    final httpResponse = await CourseApiService.updateEnrolmentsRequest(courseId, ids);

    print(httpResponse.body);

    if (httpResponse.statusCode == HttpStatus.ok){
      return DataSuccess(httpResponse.body);
    } else {
      return DataFailed();
    }
  }

}