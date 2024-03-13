import 'package:flutter/material.dart';
import 'package:hope/components/custom_text_box.dart';
import 'package:hope/components/list_item.dart';
import 'package:hope/providers/student_list_provider.dart';
import 'package:provider/provider.dart';

class GetStudentsBody extends StatelessWidget {
  const GetStudentsBody({super.key});

  @override
  Widget build(BuildContext context) {

    var students = context.watch<StudentListProvider>().studentList;

    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        return ListItem(
          student: students[index],
          index: index,
        );
      },
    );
  }
}

class GetStudentsHeader extends StatelessWidget {
  const GetStudentsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
      child: Container(
        height: 42,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            color: Color(0xff95D7FF),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Row(

          ///Todo: Make it scrollable so that it fits different screens
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextBox(title: 'نام و نام‌خانوادگی'),
            CustomTextBox(title: 'شماره دانشجویی'),
            CustomTextBox(title: 'سال ورودی'),
            CustomTextBox(title: 'ایمیل'),
            CustomTextBox(title: 'شماره تلفن'),
            SizedBox(width: 170,)
          ],
        ),
      ),
    );
  }
}

