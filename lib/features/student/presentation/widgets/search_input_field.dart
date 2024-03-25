import 'package:flutter/material.dart';
import 'package:hope/core/themes/custom_colors.dart';
import 'package:hope/features/student/models/student.dart';
import 'package:hope/features/student/presentation/providers/student_provider.dart';
import 'package:provider/provider.dart';

class SearchInputField extends StatelessWidget {
  SearchInputField({super.key, required this.students});
  List<Student> students;

  OutlineInputBorder _buildBorder(Color color, {double width = 1.0}) {

    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: color, width: width));
  }
  TextStyle _buildTextStyle(Color color, {double size = 16.0}){
    return TextStyle(
        color: color,
        fontSize: size
    );
  }

  void runFilter(String enteredKeyword, BuildContext context, List<Student> students) {
    List<Student> result = [];
    if (enteredKeyword.isEmpty) {
      result = students;
    }
    else {
      result = students
          .where((student) => student.fullName.contains(enteredKeyword) || student.studentID.contains(enteredKeyword)).toList();
    }

    context.read<StudentProvider>().filterStudents(result);
  }

  @override
  Widget build(BuildContext context) {
    //var students = context.watch()<StudentProvider>().students;
    return Padding(
      padding: const EdgeInsets.fromLTRB(7, 0, 7, 28),
      child: SizedBox(
          width: 300,
          child: TextField(
            onChanged: (value) => runFilter(value, context, students),
            //style: _buildTextStyle(CustomColors.borderColor, size: 12),
            decoration: InputDecoration(
              enabledBorder: _buildBorder(Color(0xff4EBCFF)),
              suffixIcon: Icon(Icons.search, color: Color(0xff4EBCFF)),
              hintText: 'جست‌و‌جو ...',
              hintStyle: _buildTextStyle(Color(0xff4EBCFF)),
            ),
          )),
    );
  }
}
