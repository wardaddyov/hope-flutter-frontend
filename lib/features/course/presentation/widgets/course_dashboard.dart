import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hope/core/widgets/dashboard_container_header.dart';
import 'package:hope/features/course/model/course.dart';
import 'package:hope/features/course/presentation/provider/course_page_index_provider.dart';
import 'package:hope/features/course/presentation/provider/course_provider.dart';
import 'package:hope/features/course/presentation/provider/enrolment_provider.dart';
import 'package:hope/features/course/presentation/provider/new_course_cache.dart';
import 'package:provider/provider.dart';

class CourseDashboard extends StatelessWidget {
  const CourseDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final course = context.read<CourseProvider>().selectedCourse!;
    return Column(
      children: [
        DashboardContainerHeader(title: course.name, leftElement: ActionButtons())
      ],
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        EditCourseButton(),
        DeleteCourseButton(),
        SizedBox(width: 6,),
        Separator(),
        BackToListButton(),
      ],
    );
  }
}


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
          NewCourseCache.activationStatus = course.activation ? 'فعال' : 'غیرفعال';
          context.read<CourseProvider>().isUpdating = true;
          context.read<EnrolmentProvider>().getEnrolments(course);

          context.read<CoursePageIndexProvider>().changeSelectedIndex(newIndex: 1);

        },
        icon: SvgPicture.asset(
          'assets/PenNewSquare.svg',
          semanticsLabel: 'edit student',
        ));
  }
}

class DeleteCourseButton extends StatelessWidget {
  const DeleteCourseButton({super.key});
  @override
  Widget build(BuildContext context) {
    final course = context.read<CourseProvider>().selectedCourse!;
    return IconButton(
        onPressed: () {
          context.read<CourseProvider>().deleteCourse(course);
          context.read<CoursePageIndexProvider>().changeSelectedIndex(newIndex: 0);
        },
        icon: SvgPicture.asset(
          'assets/closeSquare.svg',
          semanticsLabel: 'delete student',
        ));
  }
}

class BackToListButton extends StatelessWidget {
  const BackToListButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<CoursePageIndexProvider>().changeSelectedIndex(newIndex: 0);
        },
        icon: SvgPicture.asset(
          width: 18,
          'assets/Vector.svg',
          semanticsLabel: 'delete student',
        ));
  }
}

class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/Line.svg',
      semanticsLabel: 'delete student',
    );
  }
}
