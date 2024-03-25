import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hope/core/widgets/custom_input_field.dart';
import 'package:hope/components/list_item.dart';
import 'package:hope/core/widgets/dashboard_container_header.dart';
import 'package:hope/core/widgets/dashboard_header_counter_text.dart';
import 'package:hope/features/course/presentation/provider/course_page_index_provider.dart';
import 'package:hope/features/course/presentation/widgets/confirm_enrolment_button.dart';
import 'package:hope/features/course/presentation/widgets/list_course.dart';
import 'package:hope/features/course/presentation/widgets/create_course.dart';
import 'package:hope/features/course/presentation/widgets/creation_from.dart';
import 'package:hope/features/student/presentation/providers/select_student.dart';
import 'package:hope/features/student/presentation/widgets/create_student.dart';
import 'package:hope/features/student/presentation/widgets/edit_student.dart';
import 'package:hope/features/student/presentation/widgets/list_students.dart';
import 'package:hope/old/pages/dashboard/student/get_students.dart';
import 'package:hope/features/student/presentation/providers/student_page_index_provider.dart';

import 'package:persian_number_utility/persian_number_utility.dart';
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
