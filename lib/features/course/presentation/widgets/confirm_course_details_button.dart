import 'package:flutter/material.dart';
import 'package:hope/features/course/model/course.dart';
import 'package:hope/features/course/presentation/provider/course_page_index_provider.dart';
import 'package:hope/features/course/presentation/provider/course_provider.dart';
import 'package:hope/features/course/presentation/provider/enrolment_provider.dart';
import 'package:hope/features/course/presentation/provider/new_course_cache.dart';
import 'package:provider/provider.dart';

class ConfirmCourseDetailsButton extends StatelessWidget {
  const ConfirmCourseDetailsButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    var createFailure = Provider.of<CourseProvider>(context).createFailure;
    var isUpdating = context.read<CourseProvider>().isUpdating;
    final String buttonText;

    if (isUpdating){
      buttonText = 'بروزرسانی';
    }
    else {
      buttonText = 'افزودن';
    }

    if (createFailure == null){
      print('waiting for server result');
    }
    if (createFailure == false){
      print('successfully created');
    }
    if (createFailure == true){
      print('failed to create course');
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(7, 28, 7, 28),
      child: ElevatedButton(


          onPressed: () {

            var isFormValid = formKey.currentState!.validate();

            if (isFormValid){
              if (!isUpdating) {
                context.read<CourseProvider>().createCourse(NewCourseCache.exportCache(), context.read<EnrolmentProvider>().enrolments);
              }
              else {
                final courseCreateDto = NewCourseCache.exportCache();
                final courseId = context.read<CourseProvider>().selectedCourse!.id;
                final course = Course( id: courseId, name: courseCreateDto.name, activation: courseCreateDto.activation, semester: courseCreateDto.semester, group: courseCreateDto.group);
                context.read<CourseProvider>().updateCourse(course, context.read<EnrolmentProvider>().enrolments);
              }
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
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
