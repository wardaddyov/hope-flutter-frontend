import 'package:flutter/material.dart';
import '../models/student.dart';

class StudentListProvider extends ChangeNotifier {

  List<Student> studentList = [];

  void updateStudentList(List<Student> newStudentList)
  {
    studentList = newStudentList;
    notifyListeners();
  }

  void addStudent(Student student)
  {
    studentList.add(student);
    notifyListeners();
  }

  void updateStudent(Student updatedStudent)
  {
    for(int i = 0; i < studentList.length; i++)
      {
        if (studentList[i].id == updatedStudent.id){
          studentList[i]  = updatedStudent;
        }
      }
    notifyListeners();
  }

  void deleteStudent(Student student)
  {
    var res = studentList.remove(student);
    print(res);
    notifyListeners();
  }
}