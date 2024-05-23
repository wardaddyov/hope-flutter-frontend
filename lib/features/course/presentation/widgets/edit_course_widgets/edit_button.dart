import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hope/features/course/data/Models/course.dart';
import 'package:hope/features/course/domain/edit_course/edit_course_bloc.dart';
import 'package:hope/features/course/presentation/provider/course_page_index_provider.dart';
import 'package:hope/features/course/presentation/provider/course_provider.dart';
import 'package:hope/features/course/presentation/provider/enrolment_provider.dart';
import 'package:hope/features/course/presentation/provider/new_course_cache.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          var isFormValid = formKey.currentState!.validate();

          if (isFormValid) {

            // Create the course object out of the fields
            final courseCreateDto = NewCourseCache.exportCache();
            final courseId = context.read<CourseProvider>().selectedCourse!.id;
            final course = Course(
                id: courseId,
                name: courseCreateDto.name,
                activation: courseCreateDto.activation,
                semester: courseCreateDto.semester,
                group: courseCreateDto.group);

            // Make the call to the event
            context.read<EditCourseBloc>().add(RequestEditCourseEvent(
                course: course,
                enrolments: context.read<EnrolmentProvider>().enrolments));
          }
        },
        style: ButtonStyle(
          elevation: MaterialStatePropertyAll(0),
          backgroundColor: MaterialStatePropertyAll(Color(0xff004DF6)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          )),
        ),
        child: BlocConsumer<EditCourseBloc, EditCourseState>(
          builder: (context, state) {
            if (state is EditCourseProcessing) {
              return SizedBox(
                height: 20,
                width: 20,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 1,
                  ),
                ),
              );
            } else {
              return Text(
                "بروزرسانی",
                style: TextStyle(color: Colors.white),
              );
            }
          },
          listener: (BuildContext context, EditCourseState state) {
            if (state is EditCourseSuccessful) {
              AnimatedSnackBar.material(
                'درس با موفقیت بروزرسانی شد',
                type: AnimatedSnackBarType.success,
              ).show(context);
              context
                  .read<CoursePageIndexProvider>()
                  .changeSelectedIndex(newIndex: 0);
            }
            if (state is EditCourseFailure) {
              AnimatedSnackBar.material(
                'خطا در بروزرسانی درس',
                type: AnimatedSnackBarType.error,
              ).show(context);
            }
          },
        ));
  }
}
