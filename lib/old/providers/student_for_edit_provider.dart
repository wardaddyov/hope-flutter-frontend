import 'package:flutter/material.dart';
import '../models/student.dart';

class StudentForEditProvider extends ChangeNotifier {

  Student? student;

  void setNewStudentForEdit(Student newStudent)
  {
    student = newStudent;
    notifyListeners();
  }
}