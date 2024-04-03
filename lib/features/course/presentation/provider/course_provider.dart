import 'package:flutter/cupertino.dart';
import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/course/Dto/course_create_dto.dart';
import 'package:hope/features/course/interfaces/course_repository.dart';
import 'package:hope/features/course/model/course.dart';
import 'package:hope/features/course/presentation/provider/new_course_cache.dart';
import 'package:hope/features/course/repository/course_repository_impl.dart';
import 'package:hope/features/student/models/student.dart';
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
      final course = Course(id: int.parse(dataState.data),name: courseCreateDto.name, activation: courseCreateDto.activation, semester: courseCreateDto.semester, group: courseCreateDto.group);
      courses?.add(course);
      NewCourseCache.resetNewCourseCache();
      createFailure = false;
    }

    if (dataState is DataFailed){
      createFailure = true;
    }

    notifyListeners();
  }

  void updateCourse(Course updatedCourse, List<Student> enrolments) async {

    //await Future.delayed(Duration(seconds: 2));
    final dataState = await courseRepositoryImpl.updateCourse(updatedCourse);

    if (dataState is DataSuccess){
      print('course Id ${updatedCourse.id}');
      final enrolmentDataState = await courseRepositoryImpl.updateEnrolments(updatedCourse.id!, enrolments);
      print('enrolment update status');
      print(enrolmentDataState);
      updateFailure = false;
    }

    if (dataState is DataFailed){
      updateFailure = true;
    }
    print('course update status');
    print(dataState);
    isUpdating = false;
    notifyListeners();
  }

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