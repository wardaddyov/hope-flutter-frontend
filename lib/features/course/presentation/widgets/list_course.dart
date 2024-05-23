import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hope/core/widgets/dashboard_container_header.dart';
import 'package:hope/features/course/data/Models/course.dart';
import 'package:hope/features/course/domain/get_course/get_course_bloc.dart';
import 'package:hope/features/course/domain/get_course/get_course_bloc.dart';
import 'package:hope/features/course/presentation/widgets/course_item.dart';
import 'package:hope/features/course/presentation/widgets/create_new_course_button.dart';
import 'package:hope/features/course/presentation/widgets/loading_circle.dart';
import 'package:provider/provider.dart';

class CourseList extends StatelessWidget {
  const CourseList({super.key});

  @override
  Widget build(BuildContext context) {
    // var courses = context.watch<CourseProvider>().courses;
    // var failure = context.watch<CourseProvider>().loadFailure;
    // Widget bodyWidget;
    //
    // // Get data for the first time
    // if (courses == null && failure == null) {
    //   bodyWidget = LoadingCircle();
    //   WidgetsBinding.instance.addPostFrameCallback(
    //       (_) => context.read<CourseProvider>().getCourses());
    // } else if (failure == true) {
    //   bodyWidget = Text('failed');
    // } else if (failure == false && courses != null) {
    //   bodyWidget = body(courses);
    // } else {
    //   bodyWidget = Text('unknown');
    // }

    context.read<GetCourseBloc>().add(RequestGetCourseEvent());

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
        ),
        header(),
        Expanded(
          child: BlocBuilder<GetCourseBloc, GetCourseState>(
            builder: (context, state) {
              if (state is GetCourseProcessing)
                {
                  return LoadingCircle();
                }
              if (state is GetCourseSuccessful)
                {
                  return body(state.courses);
                }
              if (state is GetCourseFailure)
                {
                  return Text("Failure");
                }
              return Text("unknown state");
            },
          ),
        ),
      ],
    );
  }

  Widget header() => DashboardContainerHeader(
      title: 'لیست درس‌ها', leftElement: CreateNewButton());

  Widget body(List<Course> courses) {
    return SingleChildScrollView(
      child: Wrap(
          alignment: WrapAlignment.start,
          children:
              //List.generate(30, (index) => CourseItem(course: Course(name: 'name', activation: false, semester: 0, group: 0)))
              List.generate(courses.length,
                  (index) => CourseItem(course: courses[index]))),
    );
  }
}
