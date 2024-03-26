import 'package:flutter/cupertino.dart';
import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/course/Dto/course_create_dto.dart';
import 'package:hope/features/course/model/course.dart';
import 'package:hope/features/course/repository/course_repository_impl.dart';
import 'package:hope/features/student/models/student.dart';

class CourseProvider extends ChangeNotifier{
  List<Course>? courses;
  bool? loadFailure;
  bool? createFailure;
  CourseRepositoryImpl courseRepositoryImpl = CourseRepositoryImpl();

  void getCourses() async {


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

  void createCourse(CourseCreateDto courseCreateDto, List<Student> enrolments) async {

    //await Future.delayed(Duration(seconds: 2));
    final dataState = await courseRepositoryImpl.createCourse(courseCreateDto);

    if (dataState is DataSuccess){
      final enrolmentDataState = await courseRepositoryImpl.createEnrolments(int.parse(dataState.data), enrolments);
      createFailure = false;
    }

    if (dataState is DataFailed){
      createFailure = true;
    }

    notifyListeners();
  }
}