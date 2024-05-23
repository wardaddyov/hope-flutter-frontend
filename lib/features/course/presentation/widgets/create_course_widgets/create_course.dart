import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hope/core/widgets/dashboard_container_header.dart';
import 'package:hope/features/course/presentation/provider/course_page_index_provider.dart';
import 'package:hope/features/course/presentation/provider/enrolment_provider.dart';
import 'package:hope/features/course/presentation/provider/new_course_cache.dart';
import 'package:hope/features/course/presentation/widgets/creation_from.dart';
import 'package:hope/features/course/presentation/widgets/create_course_widgets/create_button.dart';
import 'package:provider/provider.dart';

class CreateCourse extends StatelessWidget {
  CreateCourse({super.key});
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        header(),
        Expanded(child: CreationForm(formKey: formKey,))
      ],
    );
  }

  Widget header() => DashboardContainerHeader(title: 'افزودن کلاس جدید', leftElement: Row(
    children: [
      CancelButton(),
      CreateButton(formKey: formKey,),
    ],
  ));
}

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        NewCourseCache.resetNewCourseCache();
        context.read<EnrolmentProvider>().clearEnrolmentList();

        context
            .read<CoursePageIndexProvider>()
            .changeSelectedIndex(newIndex: 0);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xffEA2A33)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            )),
      ),
      child: Text(
        "انصراف",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
