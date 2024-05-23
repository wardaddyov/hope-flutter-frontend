import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hope/features/exam/domain/update_participants_bloc/update_participants_bloc.dart';
import 'package:hope/features/exam/presentation/providers/exam_provider.dart';
import 'package:hope/features/exam/presentation/providers/participant_provider.dart';

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
            context.read<UpdateParticipantsBloc>().add(UpdateParticipants(
                ExamProvider.getExam()!,
                participants: ParticipantsProvider.getParticipants()!));
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xff117A28)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          )),
        ),
        child: SizedBox(
          width: 70,
          child: Center(
            child: BlocConsumer<UpdateParticipantsBloc, UpdateParticipantsState>(
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
                else {
                  return Text(
                    "ثبت نمرات",
                    style: TextStyle(color: Colors.white),
                  );
                }
              },
              listener: (BuildContext context, UpdateParticipantsState state) {
                if (state is UpdateSuccessful){
                  AnimatedSnackBar.material(
                    'نمرات با موفقیت ثبت شد',
                    type: AnimatedSnackBarType.success,
                  ).show(context);
                }
                if (state is UpdateFailure){
                  AnimatedSnackBar.material(
                    'خطا در ثبت نمرات',
                    type: AnimatedSnackBarType.error,
                  ).show(context);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
