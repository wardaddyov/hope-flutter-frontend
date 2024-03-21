import 'dart:convert';
import 'dart:io';

import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/course/data_sources/remote/course_api_service.dart';
import 'package:hope/features/course/interfaces/course_repository.dart';
import 'package:hope/features/course/model/course.dart';

class CourseRepositoryImpl implements CourseRepository{
  @override
  Future<DataState> createCourse(Course course) {
    // TODO: implement createCourse
    throw UnimplementedError();
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
  Future<DataState> updateCourse(Course updatedCourse) {
    // TODO: implement updateCourse
    throw UnimplementedError();
  }

}