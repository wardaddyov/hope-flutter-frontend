import 'package:flutter/material.dart';
import 'package:hope/features/student/models/student.dart';

class EnrolmentProvider{
  static List<Student> enrolments = [];

  static void addEnrolment(Student student){
    enrolments.add(student);
  }
  static void removeEnrolment(Student student){
    enrolments.remove(student);
  }

  static void clearEnrolmentList(){
    enrolments = [];
  }

  static List<Student> getEnrolments(){
    return enrolments;
  }
}