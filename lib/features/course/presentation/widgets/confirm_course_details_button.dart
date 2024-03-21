import 'package:flutter/material.dart';
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
              context.read<CourseProvider>().createCourse(NewCourseCache.exportCache());
              EnrolmentProvider.clearEnrolmentList();
              // context
              //     .read<CoursePageIndexProvider>()
              //     .changeSelectedIndex(newIndex: 2);
            }
          },


          style: ButtonStyle(
            elevation: MaterialStatePropertyAll(0),
            backgroundColor: MaterialStatePropertyAll(Color(0xff0077c0)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )),
          ),
          child: Text(
            'بعدی',
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
