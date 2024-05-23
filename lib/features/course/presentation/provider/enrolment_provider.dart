import 'package:flutter/material.dart';
import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/course/data/Models/course.dart';
import 'package:hope/features/course/data/Repository/course_repository_impl.dart';
import 'package:hope/features/student/data/models/student.dart';

class EnrolmentProvider extends ChangeNotifier
{
  CourseRepositoryImpl courseRepositoryImpl = CourseRepositoryImpl();
  List<Student> enrolments = [];
  bool? postFailed;

  void addEnrolment(Student student){
    enrolments.add(student);
    notifyListeners();
  }
  void removeEnrolment(Student student){
    enrolments.remove(student);
    notifyListeners();
  }

  void postEnrolment(int courseId, List<Student> students) async {

    //await Future.delayed(Duration(seconds: 2));
    final dataState = await courseRepositoryImpl.createEnrolments(courseId, students);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty){
      postFailed = false;
    }

    if (dataState is DataFailed){
      postFailed = true;
    }

    notifyListeners();
  }

  void getEnrolments(Course course,) async {


    //await Future.delayed(Duration(seconds: 2));
    final dataState = await courseRepositoryImpl.getEnrolments(course);

    if (dataState is DataSuccess){
      enrolments = dataState.data!;
    }

    if (dataState is DataFailed){
      postFailed = true;
    }

    notifyListeners();
  }

  void clearEnrolmentList(){
    enrolments = [];
  }
}