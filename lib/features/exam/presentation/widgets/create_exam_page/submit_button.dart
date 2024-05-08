import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hope/core/themes/custom_colors.dart';
import 'package:hope/features/exam/data/exam.dart';
import 'package:hope/features/exam/presentation/providers/create_exam_bloc/create_exam_bloc.dart';
import 'package:hope/features/exam/presentation/providers/new_exam_cache.dart';

class SubmitButton extends StatelessWidget {
  SubmitButton({super.key, required this.formKey});

  GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () async {
          var formIsValid = formKey.currentState!.validate();

          if (formIsValid) {
            formKey.currentState!.save();
            NewExamCache().courseId = 2;
            context.read<CreateExamBloc>().add(RequestCreateExam(
                exam: NewExamCache().exportCache()));
          }
        },
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(CustomColors.confirmButtonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          )),
        ),
        child: BlocBuilder<CreateExamBloc, CreateExamState>(
          builder: (context, state) {
            if (state is CreateExamInitial) {
              return Text(
                "افزودن",
                style: TextStyle(color: Colors.white),
              );
            }
            if (state is CreateExamRequesting) {
              return SizedBox(
                height: 20,
                width: 20,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 1,
                  ),
                ),
              );
            }
            if (state is CreateExamSuccessful) {
              return Text(
                "افزودن",
                style: TextStyle(color: Colors.green),
              );
            }
            if (state is CreateExamFailure) {
              return Text(
                "افزودن",
                style: TextStyle(color: Colors.red),
              );
            } else {
              return Text(
                "افزودن",
                style: TextStyle(color: Colors.white),
              );
            }
          },
        ),
      ),
    );
  }
}
