import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hope/features/exam/presentation/providers/get_participants_bloc/get_participants_bloc.dart';
import 'package:hope/features/exam/presentation/widgets/exam_dashboard_page/participant_item.dart';

class ExamDashboardBody extends StatelessWidget {
  ExamDashboardBody({
    required this.formKey,
    super.key,
  });
  GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetParticipantsBloc, GetParticipantsState>(
      builder: (context, state) {
        if (state is Loading){
          return Center(
            child: CircularProgressIndicator(
              color: Color(0xff0077c0),
              strokeWidth: 5,
            ),
          );
        }
        if (state is ParticipantsLoaded){
          var participants = state.participants;
          return Container(
            constraints: BoxConstraints(maxWidth: 800),
            child: Form(
              //Todo: add switching with tab functionality
              key: formKey,
              child: ListView.builder(
                itemCount: participants.length,
                itemBuilder: (context, index) {
                  return ParticipantItem(participant: participants[index],);
                },
              ),
            ),
          );
        }
        if (state is LoadingFailed)
        {
          return Text('Loading failed');
        }
        return Text('Unknown failure');
      },
    );
  }
}
