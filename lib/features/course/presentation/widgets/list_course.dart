import 'package:flutter/material.dart';
import 'package:hope/core/widgets/dashboard_container_header.dart';
import 'package:hope/core/widgets/dashboard_header_counter_text.dart';
import 'package:hope/features/course/model/course.dart';
import 'package:hope/features/course/presentation/provider/course_provider.dart';
import 'package:hope/features/course/presentation/widgets/course_item.dart';
import 'package:hope/features/course/presentation/widgets/create_new_course_button.dart';
import 'package:hope/features/course/presentation/widgets/loading_circle.dart';
import 'package:provider/provider.dart';

class CourseList extends StatelessWidget {
  const CourseList({super.key});

  @override
  Widget build(BuildContext context) {
    var courses = context.watch<CourseProvider>().courses;
    var failure = context.watch<CourseProvider>().loadFailure;
    Widget bodyWidget;

    // Get data for the first time
    if (courses == null && failure == null){
      bodyWidget = LoadingCircle();
      WidgetsBinding.instance
          .addPostFrameCallback((_) =>
          context.read<CourseProvider>().getCourses());
    }
    else if (failure == true){
      bodyWidget = Text('failed');
    }
    else if (failure == false && courses != null){
      bodyWidget = body(courses);
    }
    else{
      bodyWidget = Text('unknown');
    }


    return Column(
      children: [
        SizedBox(width: double.infinity,),
        header(),
        Expanded(
          child: bodyWidget,
        ),
      ],
    );
  }

  Widget header() => DashboardContainerHeader(title: 'لیست درس‌ها', leftElement: CreateNewButton());

  Widget body(List<Course> courses) {
    return SingleChildScrollView(
      child: Wrap(
        alignment: WrapAlignment.start,
          children:
          //List.generate(30, (index) => CourseItem(course: Course(name: 'name', activation: false, semester: 0, group: 0)))
          List.generate(courses.length, (index) => CourseItem(course: courses[index]))
      ),
    );
  }
}
