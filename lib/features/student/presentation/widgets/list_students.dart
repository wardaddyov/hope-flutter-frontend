import 'package:flutter/material.dart';
import 'package:hope/features/student/presentation/widgets/create_student_button.dart';
import 'package:hope/core/widgets/custom_text_box.dart';
import 'package:hope/core/widgets/dashboard_container_header.dart';
import 'package:hope/features/course/presentation/widgets/loading_circle.dart';
import 'package:hope/features/student/data/models/student.dart';
import 'package:hope/features/student/presentation/providers/student_provider.dart';
import 'package:hope/features/student/presentation/widgets/search_input_field.dart';
import 'package:hope/features/student/presentation/widgets/sorting_option_widget.dart';
import 'package:hope/features/student/presentation/widgets/student_item.dart';
import 'package:provider/provider.dart';

class ListStudents extends StatelessWidget {
  ListStudents({super.key});

  @override
  Widget build(BuildContext context) {
    var students = context.watch<StudentProvider>().students;
    var filteredStudents = context.watch<StudentProvider>().filteredStudents;
    var failure = context.watch<StudentProvider>().loadFailure;

    Widget bodyWidget;
    Widget searchWidget = SizedBox.shrink();
    Widget sortOptionWidget = SizedBox.shrink();

    // Get data for the first time
    if (students == null && failure == null ) {
      bodyWidget = LoadingCircle();
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => context.read<StudentProvider>().getStudent());
    } else if (failure == true) {
      bodyWidget = Text('failed');
    } else if (failure == false && students != null) {
      bodyWidget = body(filteredStudents);
      searchWidget = SearchInputField(
        students: students,
      );
      sortOptionWidget = SortingOptionWidget();

    } else {
      bodyWidget = Text('unknown');
    }

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
        ),
        header(context),
        secondaryHeader(sortOptionWidget, searchWidget),
        ListHeader(),
        Expanded(
          child: bodyWidget,
        ),
      ],
    );
  }

  Row secondaryHeader(Widget sortOptionWidget, Widget searchWidget) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [sortOptionWidget, searchWidget],
      );
  }

  Widget header(BuildContext context) => DashboardContainerHeader(
      title: 'لیست دانشجویان', leftElement: CreateStudentButton());

  Widget body(List<Student> students) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        return StudentItem(
          student: students[index],
          index: index,
        );
      },
    );
  }
}

class ListHeader extends StatelessWidget {
  const ListHeader({super.key});

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
            CustomTextBox(title: 'عملیات')
          ],
        ),
      ),
    );
  }
}
