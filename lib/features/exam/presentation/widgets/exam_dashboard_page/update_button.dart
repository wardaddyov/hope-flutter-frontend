import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hope/core/themes/custom_colors.dart';
import 'package:hope/features/exam/data/exam.dart';
import 'package:hope/features/exam/presentation/providers/create_exam_bloc/create_exam_bloc.dart';
import 'package:hope/features/exam/presentation/providers/exam_provider.dart';
import 'package:hope/features/exam/presentation/providers/new_exam_cache.dart';
import 'package:hope/features/exam/presentation/providers/participant_provider.dart';
import 'package:hope/features/exam/presentation/providers/update_participants_bloc/update_participants_bloc.dart';

class UpdateButton extends StatelessWidget {
  UpdateButton({super.key, required this.formKey});

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
            //Todo: I am going to need bloc to bloc communication to get my participants data
            context.read<UpdateParticipantsBloc>().add(UpdateParticipants(ExamProvider.getExam()!, participants: ParticipantsProvider.getParticipants()!));
          }
        },
        style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all(Color(0xff117A28)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              )),
        ),
        child: BlocBuilder<UpdateParticipantsBloc, UpdateParticipantsState>(
          builder: (context, state) {
            if (state is UpdateParticipantsInitial) {
              return Text(
                "ثبت نمرات",
                style: TextStyle(color: Colors.white),
              );
            }
            if (state is UpdateInitiated) {
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
            if (state is UpdateSuccessful) {
              return Text(
                "موفق",
                style: TextStyle(color: Colors.green),
              );
            }
            if (state is UpdateFailure) {
              return Text(
                "ناموفق",
                style: TextStyle(color: Colors.red),
              );
            } else {
              return Text(
                "نا معلوم",
                style: TextStyle(color: Colors.white),
              );
            }
          },
        ),
      ),
    );
  }
}
