import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hope/core/widgets/dashboard_container_header.dart';
import 'package:hope/core/widgets/seperator.dart';
import 'package:hope/features/course/presentation/provider/course_page_index_provider.dart';
import 'package:hope/features/course/presentation/provider/course_provider.dart';
import 'package:hope/features/exam/data/exam.dart';
import 'package:hope/features/exam/presentation/providers/get_participants_bloc/get_participants_bloc.dart';
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



