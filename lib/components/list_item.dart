import 'package:flutter/material.dart';
import 'package:hope/core/themes/custom_colors.dart';

import 'package:provider/provider.dart';

import '../old/models/student.dart';

import '../old/providers/student_dashboard_index_provider.dart';
import '../old/providers/student_for_edit_provider.dart';
import 'custom_text_box.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.student, required this.index});

  final Student student;
  final int index;

  @override
  Widget build(BuildContext context) {
    final int? id = student.id;
    final String name = '${student.firstname} ${student.lastname}';
    final String studentId = student.studentID;
    final String entryYear = student.entryYear.toString();
    final String email = student.email;
    final String phone = student.phoneNumber;

    Color color = selectColor(index);

    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 1, 8, 0),
      child: Container(
        height: 42,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Row(
          ///Todo: Make it scrollable so that it fits different screens
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextBox(title: name),
            CustomTextBox(title: studentId),
            CustomTextBox(title: entryYear),
            CustomTextBox(title: email),
            CustomTextBox(title: phone),
            SizedBox(
              width: 170,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        context.read<StudentForEditProvider>().setNewStudentForEdit(student);
                        context.read<StudentDashboardIndexProvider>().changeSelectedIndex(newIndex: 2);
                      },
                      icon: Icon(Icons.edit)),
                  IconButton(onPressed: () {},
                      icon: Icon(Icons.remove)),
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


