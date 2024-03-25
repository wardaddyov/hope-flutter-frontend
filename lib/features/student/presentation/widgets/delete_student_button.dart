import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hope/features/student/presentation/providers/student_provider.dart';
import 'package:provider/provider.dart';

class DeleteStudentButton extends StatelessWidget {
  const DeleteStudentButton({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<StudentProvider>().deleteStudent(id);
        },
        icon: SvgPicture.asset(
          'assets/closeSquare.svg',
          semanticsLabel: 'delete student',
        ));
  }
}
