import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hope/features/course/data/Models/course.dart';
import 'package:hope/features/course/presentation/provider/course_page_index_provider.dart';
import 'package:hope/features/course/presentation/provider/course_provider.dart';
import 'package:hope/features/exam/domain/get_exam/get_exam_bloc.dart';
import 'package:hope/features/exam/presentation/providers/new_exam_cache.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';

class CourseItem extends StatelessWidget {
  CourseItem({super.key, required this.course});

  Course course;

  @override
  Widget build(BuildContext context) {
    String name = course.name;
    String group = course.group.toString().toPersianDigit();
    String semester = course.semester.toString().toPersianDigit();
    return GestureDetector(
      onTap: () {
        NewExamCache().courseId = course.id;
        context.read<CourseProvider>().selectNewCourse(course);
        context.read<CoursePageIndexProvider>().changeSelectedIndex(
            newIndex: 3);
        context.read<GetExamBloc>().add(RequestGetExam(course: course));
      },
      child: Container(
        margin: EdgeInsets.all(12),
        width: MediaQuery
            .of(context)
            .size
            .width / 4,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Center(
          child: Text('$name - گروه $group - ترم $semester'),
        ),
      ),
    );
  }
}
