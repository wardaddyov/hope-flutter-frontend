import 'package:flutter/material.dart';
import 'package:hope/features/student/models/student.dart';


class SelectStudent extends ChangeNotifier {
  Student? student;

  void selectNewStudent(Student newStudent) {
    student = newStudent;
    notifyListeners();
  }
}
