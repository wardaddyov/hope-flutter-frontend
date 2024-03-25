import 'package:flutter/material.dart';
import 'package:hope/features/student/presentation/providers/student_page_index_provider.dart';
import 'package:provider/provider.dart';

class CreateStudentButton extends StatelessWidget {
  const CreateStudentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(7, 28, 7, 28),
      child: ElevatedButton(
          onPressed: () {
            context
            .read<StudentPageIndexProvider>()
            .changeSelectedIndex(newIndex: 1);
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
            'افزودن جدید',
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
