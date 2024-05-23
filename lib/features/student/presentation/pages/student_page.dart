import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hope/features/student/presentation/providers/select_student.dart';
import 'package:hope/features/student/presentation/widgets/create_student.dart';
import 'package:hope/features/student/presentation/widgets/edit_student.dart';
import 'package:hope/features/student/presentation/widgets/list_students.dart';
import 'package:hope/features/student/presentation/providers/student_page_index_provider.dart';

import 'package:provider/provider.dart';



class StudentPage extends StatelessWidget {
  StudentPage({super.key});

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget body;
    selectedIndex =
        context.watch<StudentPageIndexProvider>().selectedIndex;

    switch (selectedIndex) {
      case 0:
        body = ListStudents();
      case 1:
        body = CreateStudent();
      case 2:
        body = EditStudent(student: context.read<SelectStudent>().student!,);

      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return body;
  }
}
