import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hope/features/student/data/models/student.dart';
import 'package:hope/features/student/presentation/providers/select_student.dart';
import 'package:hope/features/student/presentation/providers/student_page_index_provider.dart';
import 'package:provider/provider.dart';

class EditStudentButton extends StatelessWidget {
  const EditStudentButton({super.key, required this.student});
  final Student student;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context
              .read<StudentPageIndexProvider>()
              .changeSelectedIndex(newIndex: 2);
          context.read<SelectStudent>().selectNewStudent(student);
        },
        icon: SvgPicture.asset(
          'assets/PenNewSquare.svg',
          semanticsLabel: 'edit student',
        ));
  }
}
