import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hope/features/course/domain/delete_course/delete_course_bloc.dart';
import 'package:hope/features/course/presentation/provider/course_page_index_provider.dart';
import 'package:hope/features/course/presentation/provider/course_provider.dart';


class DeleteCourseButton extends StatelessWidget {
  const DeleteCourseButton({super.key});

  @override
  Widget build(BuildContext context) {
    final course = context
        .read<CourseProvider>()
        .selectedCourse!;
    return BlocListener<DeleteCourseBloc, DeleteCourseState>(
      listener: (context, state) {
        if (state is DeleteCourseSuccessful) {
          AnimatedSnackBar.material(
            'درس با موفقیت حذف شد',
            type: AnimatedSnackBarType.success,
          ).show(context);

          // Go back to the course list page
          context
              .read<CoursePageIndexProvider>()
              .changeSelectedIndex(newIndex: 0);
        }
        if (state is DeleteCourseFailure) {
          AnimatedSnackBar.material(
            'خطا در حذف درس',
            type: AnimatedSnackBarType.error,
          ).show(context);
        }
      },
      child: IconButton(
          onPressed: () {
            context.read<DeleteCourseBloc>().add(
                RequestDeleteCourseEvent(course: course));
          },
          icon: BlocBuilder<DeleteCourseBloc, DeleteCourseState>(
            builder: (context, state) {
              if (state is DeleteCourseProcessing)
                {
                  return SizedBox(
                    height: 15,
                    width: 15,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                        strokeWidth: 3,
                      ),
                    ),
                  );
                }
              return SvgPicture.asset(
                'assets/closeSquare.svg',
                semanticsLabel: 'delete student',
              );
            },
          )),
    );
  }
}