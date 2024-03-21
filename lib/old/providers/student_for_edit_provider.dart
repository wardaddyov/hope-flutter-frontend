import 'package:flutter/material.dart';

import '../../features/student/models/student.dart';

class StudentForEditProvider extends ChangeNotifier {
  Student? student;

  void setNewStudentForEdit(Student newStudent) {
    student = newStudent;
    notifyListeners();
  }
}
