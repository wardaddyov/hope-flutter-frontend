import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hope/core/widgets/custom_input_field.dart';
import 'package:hope/components/list_item.dart';
import 'package:hope/core/widgets/dashboard_container_header.dart';
import 'package:hope/core/widgets/dashboard_header_counter_text.dart';
import 'package:hope/features/course/presentation/provider/course_page_index_provider.dart';
import 'package:hope/features/course/presentation/widgets/confirm_enrolment_button.dart';
import 'package:hope/features/course/presentation/widgets/course_list.dart';
import 'package:hope/features/course/presentation/widgets/create_course.dart';
import 'package:hope/features/course/presentation/widgets/creation_from.dart';
import 'package:hope/old/pages/dashboard/student/get_students.dart';

import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';

import '../../../../features/student/models/student.dart';


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
        body = CreationForm();
      // Select Student
      case 2:
        body = Column(
          children: [
            DashboardContainerHeader(title: 'لیست دانشجویان', leftElement: ConfirmEnrolmentButton()),
            GetStudentsHeader(),
            Expanded(
              child: GetStudentsBody(isItemSelectable: true, isItemEditable: false,),
            ),
          ],
        );
      // Update courses

      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return body;
  }
}
