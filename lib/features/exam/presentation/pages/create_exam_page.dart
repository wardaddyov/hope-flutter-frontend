import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hope/core/widgets/dashboard_container_header.dart';
import 'package:hope/core/widgets/dashboard_header_counter_text.dart';
import 'package:hope/features/exam/domain/create_exam_bloc/create_exam_bloc.dart';
import 'package:hope/features/exam/presentation/widgets/create_exam_page/cancel_button.dart';
import 'package:hope/features/exam/presentation/widgets/create_exam_page/date_field.dart';
import 'package:hope/features/exam/presentation/widgets/create_exam_page/description_field.dart';
import 'package:hope/features/exam/presentation/widgets/create_exam_page/exam_name_field.dart';
import 'package:hope/features/exam/presentation/widgets/create_exam_page/exam_type_dropdown.dart';
import 'package:hope/features/exam/presentation/widgets/create_exam_page/openbook_dropdown.dart';
import 'package:hope/features/exam/presentation/widgets/create_exam_page/question_type_dropdown.dart';
import 'package:hope/features/exam/presentation/widgets/create_exam_page/score_field.dart';
import 'package:hope/features/exam/presentation/widgets/create_exam_page/submit_button.dart';

class CreateExamPage extends StatelessWidget {
  CreateExamPage({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateExamBloc(),
      child: Column(
        children: [
          DashboardContainerHeader(title: 'افزودن آزمون جدید',
              leftElement: DashboardHeaderCounterText(
                unit: 'آزمون', count: 'null', title: 'تعداد آزمون های شما:',)),
          Form(
            key: _formKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [

                    ExamNameField(),
                    DateField(),
                    ExamDescriptionField(),
                  ],
                ),
                SizedBox(width: 20,),
                Column(
                  children: [
                    QuestionTypeDropdown(),
                    ExamTypeDropdown(),
                    OpenbookDropdown(),
                    ExamScoreField(),
                    Row(
                      children: [
                        CancelButton(),
                        SubmitButton(formKey: _formKey,),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
