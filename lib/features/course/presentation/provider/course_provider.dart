import 'package:flutter/cupertino.dart';
import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/course/data/Repository/course_repository.dart';
import 'package:hope/features/course/data/Models/course.dart';
import 'package:hope/locater.dart';

class CourseProvider extends ChangeNotifier{
  List<Course>? courses;
  bool? loadFailure;
  bool? createFailure;
  bool? deleteFailed;
  bool? updateFailure;
  bool isUpdating = false;
  Course? selectedCourse;

  CourseRepository courseRepositoryImpl = getIt<CourseRepository>();


  Future<void> deleteCourse(Course course) async {
    final dataState = await courseRepositoryImpl.deleteCourse(course);
    if (dataState is DataSuccess){
      courses?.removeWhere((element) => element.id == course.id);
      deleteFailed = false;
    }

    if (dataState is DataFailed){
      deleteFailed = true;
    }

    notifyListeners();
  }

  void selectNewCourse(Course newCourse) {
    selectedCourse = newCourse;
    notifyListeners();
  }
}