import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hope/features/course/presentation/provider/course_provider.dart';
import 'package:hope/features/course/presentation/provider/enrolment_provider.dart';
import 'package:hope/features/course/presentation/provider/new_course_cache.dart';
import 'package:provider/provider.dart';

import '../../provider/course_page_index_provider.dart';

class EditCourseButton extends StatelessWidget {
  const EditCourseButton({super.key});

  @override
  Widget build(BuildContext context) {
    final course = context.read<CourseProvider>().selectedCourse!;

    return IconButton(
        onPressed: () {
          NewCourseCache.name = course.name;
          NewCourseCache.group = course.group.toString();
          NewCourseCache.semester = course.semester.toString();
          NewCourseCache.activationStatus =
          course.activation ? 'فعال' : 'غیرفعال';
          context.read<CourseProvider>().isUpdating = true;
          context.read<EnrolmentProvider>().getEnrolments(course);

          context
              .read<CoursePageIndexProvider>()
              .changeSelectedIndex(newIndex: 6);
        },
        icon: SvgPicture.asset(
          'assets/PenNewSquare.svg',
          semanticsLabel: 'edit student',
        ));
  }
}