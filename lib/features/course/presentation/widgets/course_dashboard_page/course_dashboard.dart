
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hope/core/widgets/dashboard_container_header.dart';
import 'package:hope/features/course/presentation/provider/course_page_index_provider.dart';
import 'package:hope/features/course/presentation/provider/course_provider.dart';
import 'package:hope/features/course/presentation/widgets/course_dashboard_page/rollcall_button.dart';
import 'package:hope/features/course/presentation/widgets/course_dashboard_page/sources_button.dart';
import 'package:hope/features/course/presentation/widgets/course_dashboard_page/syllabus_button.dart';
import 'package:hope/features/course/presentation/widgets/exam_item.dart';
import 'package:hope/features/exam/domain/get_exam/get_exam_bloc.dart';
import 'package:provider/provider.dart';

import 'create_new_exam_button.dart';
import 'delete_course_button.dart';
import 'edit_course_button.dart';

class CourseDashboard extends StatelessWidget {
  const CourseDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final course = context.read<CourseProvider>().selectedCourse!;

    return Column(
      children: [
        DashboardContainerHeader(
            title: course.name, leftElement: ActionButtons()),

        Row(
          mainAxisSize: MainAxisSize.min,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RollCallButton(),
            SyllabusButton(),
            SourcesButton(),
          ],
        ),

        DashboardContainerHeader(
            title: 'لیست امتحانات و تمارین', leftElement: CreateNewExamButton()),

        BlocBuilder<GetExamBloc, GetExamState>(
          builder: (context, state) {
            if (state is GetExamInitial) {
              return SizedBox(
                height: 20,
                width: 20,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                    strokeWidth: 1,
                  ),
                ),
              );
            }
            if (state is GetExamSuccessful) {
              return SizedBox(

                width: 400,
                height: 184,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.exams.length,
                  itemBuilder: (context, index) {
                    return ExamItem(
                      exam: state.exams[index],
                    );
                  },
                ),
              );
            }

            if (state is GetExamFailure) {
              return Text(state.error,);
            }
            return Text("unknown");
          },
        ),
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
        SizedBox(
          width: 6,
        ),
        Separator(),
        BackToListButton(),
      ],
    );
  }
}


class BackToListButton extends StatelessWidget {
  const BackToListButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context
              .read<CoursePageIndexProvider>()
              .changeSelectedIndex(newIndex: 0);
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
