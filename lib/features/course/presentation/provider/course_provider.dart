import 'package:flutter/cupertino.dart';
import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/course/Dto/course_create_dto.dart';
import 'package:hope/features/course/model/course.dart';
import 'package:hope/features/course/repository/course_repository_impl.dart';

class CourseProvider extends ChangeNotifier{
  List<Course>? courses;
  bool? loadFailure;
  bool? createFailure;

  void getCourses() async {
    CourseRepositoryImpl courseRepositoryImpl = CourseRepositoryImpl();

    notifyListeners();

    await Future.delayed(Duration(seconds: 2));
    final dataState = await courseRepositoryImpl.getCourses();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty){
      courses = dataState.data!;
      loadFailure = false;
    }

    if (dataState is DataFailed){
      loadFailure = true;
    }

    notifyListeners();
  }

  void createCourse(CourseCreateDto courseCreateDto) async {
    CourseRepositoryImpl courseRepositoryImpl = CourseRepositoryImpl();

    //await Future.delayed(Duration(seconds: 2));
    final dataState = await courseRepositoryImpl.createCourse(courseCreateDto);

    if (dataState is DataSuccess){
      createFailure = false;
    }

    if (dataState is DataFailed){
      createFailure = true;
    }

    notifyListeners();
  }
}