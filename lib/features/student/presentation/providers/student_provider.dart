
import 'package:flutter/cupertino.dart';
import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/student/models/student.dart';
import 'package:hope/features/student/repository/studnet_repository_impl.dart';

class StudentProvider extends ChangeNotifier{
  List<Student>? students;
  List<Student> filteredStudents = [];
  bool? loadFailure;
  bool? createFailure;

  void getStudent() async {
    StudentRepositoryImpl studentRepositoryImpl = StudentRepositoryImpl();

    notifyListeners();

    await Future.delayed(Duration(seconds: 2));
    final dataState = await studentRepositoryImpl.getStudents();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty){
      students = dataState.data!;
      filteredStudents = students!;
      loadFailure = false;
    }

    if (dataState is DataFailed){
      loadFailure = true;
    }

    notifyListeners();
  }

  void filterStudents(List<Student> student){
    filteredStudents = student;
    notifyListeners();
  }

  void sortStudentsById(){
    students?.sort((a, b) => double.parse(a.studentID).compareTo(double.parse(b.studentID)));
    notifyListeners();
  }
  void sortStudentsByName(){
    students?.sort((a, b) => a.lastname.compareTo(b.lastname));
    notifyListeners();
  }
}