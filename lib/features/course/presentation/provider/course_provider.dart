import 'package:flutter/cupertino.dart';
import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/course/model/course.dart';
import 'package:hope/features/course/repository/course_repository_impl.dart';

class CourseProvider extends ChangeNotifier{
  List<Course>? courses;
  bool? failure;

  void getCourses() async {
    CourseRepositoryImpl courseRepositoryImpl = CourseRepositoryImpl();

    notifyListeners();

    await Future.delayed(Duration(seconds: 2));
    final dataState = await courseRepositoryImpl.getCourses();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty){
      courses = dataState.data!;
      failure = false;
    }

    if (dataState is DataFailed){
      failure = true;
    }

    notifyListeners();
  }
}