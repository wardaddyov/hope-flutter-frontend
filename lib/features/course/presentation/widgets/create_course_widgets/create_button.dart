import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hope/features/course/domain/create_course/create_course_bloc.dart';
import 'package:hope/features/course/presentation/provider/course_page_index_provider.dart';
import 'package:hope/features/course/presentation/provider/enrolment_provider.dart';
import 'package:hope/features/course/presentation/provider/new_course_cache.dart';
import 'package:provider/provider.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          var isFormValid = formKey.currentState!.validate();

          if (isFormValid) {

            context.read<CreateCourseBloc>().add(RequestCreateCourseEvent(
                course: NewCourseCache.exportCache(),
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
        child: BlocConsumer<CreateCourseBloc, CreateCourseState>(
          builder: (context, state) {
            if (state is CreateCourseProcessing) {
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
                "افزودن",
                style: TextStyle(color: Colors.white),
              );
            }
          },
          listener: (BuildContext context, CreateCourseState state) {
            if (state is CreateCourseSuccessful) {
              AnimatedSnackBar.material(
                'درس جدید با موفقیت افزوده شد',
                type: AnimatedSnackBarType.success,
              ).show(context);
              context
                  .read<CoursePageIndexProvider>()
                  .changeSelectedIndex(newIndex: 0);
            }
            if (state is CreateCourseFailure) {
              AnimatedSnackBar.material(
                'خطا در افزودن درس',
                type: AnimatedSnackBarType.error,
              ).show(context);
            }
          },
        ));
  }
}


