import 'package:hope/pages/dashboard/student/add_student.dart';
import 'package:hope/pages/dashboard/student/edit_student.dart';
import 'package:hope/pages/dashboard/student/get_students.dart';
import 'package:hope/providers/student_dashboard_index_provider.dart';
import 'package:hope/providers/student_for_edit_provider.dart';
import 'package:hope/providers/student_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hope/components/custom_input_field.dart';
import 'package:hope/components/list_item.dart';
import 'package:hope/components/login_button.dart';
import 'package:hope/repository/student_repository.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../models/student.dart';
import '../../../components/custom_text_box.dart';

class StudentDashboard extends StatelessWidget {
  StudentDashboard({super.key});
  int selectedIndex = 0;
  late List<Student> students;

  @override
  Widget build(BuildContext context) {
    Widget body;
    Widget header;
    Widget mainHeader;
    selectedIndex = context.watch<StudentDashboardIndexProvider>().selectedIndex;
    students = context.watch<StudentListProvider>().studentList;

    switch (selectedIndex) {
      case 0:
        body = GetStudentsBody();
        header = GetStudentsHeader();
        mainHeader = buildHeader(buildAddButton(context), 'لیست دانشجویان');

      case 1:
        body = AddStudentBody();
        header = SizedBox.shrink();
        mainHeader =
            buildHeader(buildStudentCountText(), 'افزودن دانشجوی جدید');

      case 2:
        body = EditStudentBody(student: context.watch<StudentForEditProvider>().student!);
        header = SizedBox.shrink();
        mainHeader = buildHeader(buildAddButton(context), 'ویرایش دانشجو');
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Column(
      children: [
        mainHeader,
        header,
        Expanded(
          child: body,
        ),
      ],
    );
  }

  SizedBox buildStudentCountText() {
    return SizedBox(
        width: 200,
        child: Row(
          children: [
            Text(
              'تعداد دانشجو های شما:',
              style: TextStyle(
                color: Color(0xff2BAEFF),
                fontSize: 12,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '${students.length.toString().toPersianDigit()} نفر!',
              style: TextStyle(
                color: Color(0xff0077C0),
                fontSize: 14,
              ),
            )
          ],
        ));
  }

  Row buildHeader(Widget leftElement, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        /// Right element is constant text
        Padding(
          padding: const EdgeInsets.fromLTRB(7, 28, 7, 28),
          child: Text(
            title,
            style: TextStyle(
              color: Color(0xff0077c0),
              fontSize: 16,
            ),
          ),
        ),

        /// Left element changes when we try to configure students
        leftElement
      ],
    );
  }

  Padding buildAddButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(7, 28, 7, 28),
      child: ElevatedButton(
          onPressed: () {
            context.read<StudentDashboardIndexProvider>().changeSelectedIndex(newIndex: 1);
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
