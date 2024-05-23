import 'package:flutter/material.dart';
import 'package:hope/core/widgets/dashboard_container_header.dart';
import 'package:hope/features/exam/presentation/widgets/exam_dashboard_page/action_buttons.dart';
import 'package:hope/features/exam/presentation/widgets/exam_dashboard_page/update_button.dart';
import '../widgets/exam_dashboard_page/dashboard_body.dart';

class ExamDashboardPage extends StatelessWidget {
  ExamDashboardPage({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DashboardContainerHeader(
            title: 'نمره دهی دانشجویان', leftElement: ActionButtons()),
        Expanded(
          child: ExamDashboardBody(formKey: _formKey,),
        ),
        UpdateButton(formKey: _formKey)
      ],
    );
  }
}



