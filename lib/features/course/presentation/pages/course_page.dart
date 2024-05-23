import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hope/features/course/presentation/provider/course_page_index_provider.dart';
import 'package:hope/features/course/presentation/widgets/course_dashboard_page/course_dashboard.dart';
import 'package:hope/features/course/presentation/widgets/edit_course_widgets/edit_course.dart';
import 'package:hope/features/course/presentation/widgets/list_course.dart';
import 'package:hope/features/course/presentation/widgets/create_course_widgets/create_course.dart';
import 'package:hope/features/course/presentation/widgets/select_student_page/list_students.dart';
import 'package:hope/features/exam/presentation/pages/create_exam_page.dart';
import 'package:hope/features/exam/presentation/pages/exam_dashboard_page.dart';

import 'package:provider/provider.dart';



class CoursePage extends StatelessWidget {
  CoursePage({super.key});

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    Widget body;
    selectedIndex =
        context.watch<CoursePageIndexProvider>().selectedIndex;

    switch (selectedIndex) {
      // Get courses
      case 0:
        body = CourseList();
      // Add courses
      case 1:
        body = CreateCourse();
      // Select Student
      case 2:
        body = ListStudents();
      // Select courses
      case 3:
        body = CourseDashboard();
      case 4:
        body = ExamDashboardPage();
      case 5:
        body = CreateExamPage();
      case 6:
        body = EditCourse();

      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return body;
  }
}
