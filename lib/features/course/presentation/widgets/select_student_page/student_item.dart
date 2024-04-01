import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hope/core/themes/custom_colors.dart';
import 'package:hope/core/widgets/custom_text_box.dart';
import 'package:hope/features/course/presentation/provider/course_page_index_provider.dart';
import 'package:hope/features/course/presentation/provider/enrolment_provider.dart';
import 'package:hope/features/student/models/student.dart';
import 'package:hope/features/student/presentation/widgets/delete_student_button.dart';
import 'package:hope/features/student/presentation/widgets/edit_student_button.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import 'package:provider/provider.dart';

class StudentItem extends StatelessWidget {
  const StudentItem({super.key, required this.student, required this.index});

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
            CheckBox(student: student),
            CustomTextBox(title: name.toPersianDigit()),
            CustomTextBox(title: studentId.toPersianDigit()),
            CustomTextBox(title: entryYear.toPersianDigit()),
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

class CheckBox extends StatefulWidget {
  const CheckBox({super.key, required this.student});
  final Student student;

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool isChecked = false;

  @override
  void initState() {
    for (var student in context.read<EnrolmentProvider>().enrolments){
      if (student.studentID == widget.student.studentID){
        isChecked = true;
        break;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Transform.scale(
        scale: 1.3,
        child: Checkbox(

          hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            overlayColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.transparent;
              }
              return null;
            }),
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (!states.contains(MaterialState.selected)) {
                return Colors.white;
              }
              return null;
            }),
          activeColor: CustomColors.confirmButtonColor,
            checkColor: CustomColors.confirmButtonColor,
            side: BorderSide(
              color: Colors.white,
            ),
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
                if (value == false) {
                  context.read<EnrolmentProvider>().removeEnrolment(widget.student);
                }
                if (value == true &&
                    !context.read<EnrolmentProvider>().enrolments.contains(widget.student)) {
                  context.read<EnrolmentProvider>().addEnrolment(widget.student);
                }
              });
            }),
      ),
    );
  }
}
