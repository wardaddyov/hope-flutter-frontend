import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/exam/data/models/exam.dart';
import 'package:hope/features/exam/data/repository/exam_repository.dart';
import 'package:hope/features/exam/data/models/participant.dart';
import 'package:hope/features/exam/presentation/providers/participant_provider.dart';
import 'package:hope/locater.dart';

part 'get_participants_event.dart';
part 'get_participants_state.dart';

class GetParticipantsBloc extends Bloc<GetParticipantsEvent, GetParticipantsState> {
  GetParticipantsBloc() : super(Loading()) {
    on<LoadParticipants>((event, emit) async {
      // Emit the loading state
      emit(Loading());

      //Inject the repository
      ExamRepository examRepository = getIt<ExamRepository>();

      // Simulate loading to see my loading functionality
      await Future.delayed(Duration(seconds: 2));

      // Make the API call
      final dataState = await examRepository.getExamParticipants(event.exam);

      // If the API call was successful:
      if (dataState is DataSuccess){
        // Convert the raw data into a list of participants
        var j = jsonDecode(dataState.data);
        List<Participant> participants = List<Participant>.from(j.map((e) => Participant.fromJson(e)));

        // we set participants here in a static method so that I can have access the data in another bloc
        ParticipantsProvider.setParticipants(participants);

        // Emit the loaded state
        emit(ParticipantsLoaded(participants: participants));
      }

      // If the API call was unsuccessful:
      if (dataState is DataFailed){
        emit(LoadingFailed());
      }
    });
  }
}
