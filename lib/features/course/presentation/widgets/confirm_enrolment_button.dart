import 'package:flutter/material.dart';
import 'package:hope/features/course/presentation/provider/course_page_index_provider.dart';
import 'package:hope/features/course/presentation/provider/enrolment_provider.dart';
import 'package:provider/provider.dart';

class ConfirmEnrolmentButton extends StatelessWidget {
  const ConfirmEnrolmentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(7, 28, 7, 28),
      child: ElevatedButton(
          onPressed: () {
            context
                .read<CoursePageIndexProvider>()
                .changeSelectedIndex(newIndex: 1);
          },
          style: ButtonStyle(
            elevation: MaterialStatePropertyAll(0),
            backgroundColor: MaterialStatePropertyAll(Color(0xff008000)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )),
          ),
          child: Text(
            'تایید',
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
