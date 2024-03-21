import 'package:flutter/material.dart';
import 'package:hope/features/course/model/course.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class CourseItem extends StatelessWidget {
  CourseItem({super.key, required this.course});

  Course course;

  @override
  Widget build(BuildContext context) {
    String name = course.name;
    String group = course.group.toString().toPersianDigit();
    String semester = course.semester.toString().toPersianDigit();
    return Container(
      margin: EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width/4,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Center(
        child: Text('$name - گروه $group - ترم $semester'),
      ),
    );
  }
}
