import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hope/core/themes/custom_colors.dart';
import 'package:hope/features/course/presentation/provider/enrolment_provider.dart';

import 'package:provider/provider.dart';

import '../features/student/models/student.dart';

import '../old/providers/student_dashboard_index_provider.dart';
import '../old/providers/student_for_edit_provider.dart';
import 'custom_text_box.dart';

class ListItem extends StatefulWidget {
  ListItem({super.key,
    required this.student,
    required this.index,
    required this.isItemSelectable,
    required this.isItemEditable});

  final Student student;
  final int index;
  final bool isItemSelectable;
  final bool isItemEditable;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Widget select;
    Widget options;
    //todo: this is possibly very inefficient
    if (EnrolmentProvider.enrolments.contains(widget.student)) {
      isChecked = true;
    }
    if (widget.isItemSelectable) {
      select = Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
              if (value == false) {
                EnrolmentProvider.removeEnrolment(widget.student);
              }
              if (value == true &&
                  !EnrolmentProvider.enrolments.contains(widget.student)) {
                EnrolmentProvider.addEnrolment(widget.student);
              }
            });
          });
    } else {
      select = SizedBox.shrink();
    }

    if (widget.isItemEditable == true) {
      options = Row(
        children: [
          IconButton(
              onPressed: () {
                context
                    .read<StudentForEditProvider>()
                    .setNewStudentForEdit(widget.student);
                context
                    .read<StudentDashboardIndexProvider>()
                    .changeSelectedIndex(newIndex: 2);
              },
              icon: Icon(Icons.edit)),
          IconButton(onPressed: () {}, icon: Icon(Icons.remove))
        ],
      );
    } else{
      options = SizedBox.shrink();
    }
    final int? id = widget.student.id;
    final String name =
    '${widget.student.firstname} ${widget.student.lastname}';
    final String studentId = widget.student.studentID;
    final String entryYear = widget.student.entryYear.toString();
    final String email = widget.student.email;
    final String phone = widget.student.phoneNumber;

    Color color = selectColor(widget.index);

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
    options,
    // Todo: make the checkbox stay on when user navigates to a different page
    select
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
