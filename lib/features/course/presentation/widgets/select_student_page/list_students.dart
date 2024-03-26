import 'package:flutter/material.dart';
import 'package:hope/core/themes/custom_colors.dart';
import 'package:hope/core/widgets/dashboard_header_counter_text.dart';
import 'package:hope/features/course/presentation/provider/course_page_index_provider.dart';
import 'package:hope/features/course/presentation/provider/enrolment_provider.dart';
import 'package:hope/features/course/presentation/widgets/select_student_page/student_item.dart';
import 'package:hope/features/student/presentation/widgets/create_student_button.dart';
import 'package:hope/core/widgets/custom_text_box.dart';
import 'package:hope/components/list_item.dart';
import 'package:hope/core/widgets/dashboard_container_header.dart';
import 'package:hope/features/course/presentation/widgets/loading_circle.dart';
import 'package:hope/features/student/models/student.dart';
import 'package:hope/features/student/presentation/providers/student_provider.dart';
import 'package:hope/features/student/presentation/widgets/search_input_field.dart';
import 'package:hope/features/student/presentation/widgets/sorting_option_widget.dart';
import 'package:hope/features/student/presentation/widgets/sorting_option_dropdown.dart';
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

    // Get data for the first time
    if (students == null && failure == null) {
      bodyWidget = LoadingCircle();
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => context.read<StudentProvider>().getStudent());
    } else if (failure == true) {
      bodyWidget = Text('failed');
    } else if (failure == false && students != null) {
      bodyWidget = ListBody(students: filteredStudents);
      searchWidget = SearchInputField(
        students: students,
      );
    } else {
      bodyWidget = Text('unknown');
    }
    print('page built');
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
        ),
        MainHeader(),
        SecondaryHeader(searchWidget: searchWidget),
        ListHeader(),
        Expanded(
          child: bodyWidget,
        ),
      ],
    );
  }

}

class SecondaryHeader extends StatelessWidget {
  const SecondaryHeader({
    super.key,
    required this.searchWidget,
  });

  final Widget searchWidget;

  @override
  Widget build(BuildContext context) {
    print('secondaryHeader built');
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [searchWidget, Row(
          children: [
            SizedBox(width: 10,),
            ConfirmButton()
          ],
        )],
      ),
    );
  }
}

class MainHeader extends StatelessWidget {
  const MainHeader({
    super.key,
  });
  @override
  Widget build(BuildContext context) => DashboardContainerHeader(
      title: 'انتخاب دانشجویان', leftElement: DashboardHeaderCounterText(title: 'تعداد دانشجوهای انتخاب شده', count: context.watch<EnrolmentProvider>().enrolments.length.toString() ,unit: 'نفر',));
}

class ListBody extends StatelessWidget {
  const ListBody({
    super.key,
    required this.students,
  });

  final List<Student> students;

  @override
  Widget build(BuildContext context) {
    print('body built');
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
    print('listHeader built');
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
            CustomTextBox(title: '#'),
            CustomTextBox(title: 'نام و نام‌خانوادگی'),
            CustomTextBox(title: 'شماره دانشجویی'),
            CustomTextBox(title: 'سال ورودی'),
          ],
        ),
      ),
    );
  }
}


class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        context
            .read<CoursePageIndexProvider>()
            .changeSelectedIndex(newIndex: 1);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(CustomColors.confirmButtonColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            )),
      ),
      child: Text(
        "تایید",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
