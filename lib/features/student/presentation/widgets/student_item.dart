
import 'package:flutter/material.dart';
import 'package:hope/core/themes/custom_colors.dart';
import 'package:hope/features/student/data/models/student.dart';
import 'package:hope/features/student/presentation/widgets/delete_student_button.dart';
import 'package:hope/features/student/presentation/widgets/edit_student_button.dart';
import 'package:persian_number_utility/persian_number_utility.dart';


import '../../../../core/widgets/custom_text_box.dart';

class StudentItem extends StatelessWidget {
  StudentItem({super.key, required this.student, required this.index});

  final Student student;
  final int index;

  @override
  Widget build(BuildContext context) {
    final String name = '${student.firstname} ${student.lastname}';
    final String studentId = student.studentID;
    final String entryYear = student.entryYear.toString();
    final String email = student.email;
    final String phone = student.phoneNumber;

    Color color = selectColor(index);

    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 1, 8, 0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Row(
          ///Todo: Make it scrollable so that it fits different screens
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextBox(title: name.toPersianDigit()),
            CustomTextBox(title: studentId.toPersianDigit()),
            CustomTextBox(title: entryYear.toPersianDigit()),
            CustomTextBox(title: email),
            CustomTextBox(title: phone.toPersianDigit()),
            SizedBox(
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EditStudentButton(student: student,),
                  DeleteStudentButton(id: student.id!,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Color selectColor(int index) {
  if (index % 2 == 0) {
    return CustomColors.dashboardContainerColor;
  } else {
    return Color(0xffB8E4FF);
  }
}
