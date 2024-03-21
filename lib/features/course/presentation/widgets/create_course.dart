import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hope/core/widgets/dashboard_container_header.dart';
import 'package:hope/features/course/presentation/widgets/creation_from.dart';
import 'package:hope/features/course/presentation/widgets/confirm_course_details_button.dart';
import 'package:provider/provider.dart';

import 'create_new_course_button.dart';

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

  Widget header() => DashboardContainerHeader(title: 'افزودن کلاس جدید', leftElement: ConfirmCourseDetailsButton(formKey: formKey,));
}
