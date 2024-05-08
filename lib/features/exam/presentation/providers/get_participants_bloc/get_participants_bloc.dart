import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/exam/data/exam.dart';
import 'package:hope/features/exam/data/exam_repository.dart';
import 'package:hope/features/exam/data/participant.dart';
import 'package:hope/features/exam/presentation/providers/participant_provider.dart';
import 'package:hope/locater.dart';

part 'get_participants_event.dart';
part 'get_participants_state.dart';

class GetParticipantsBloc extends Bloc<GetParticipantsEvent, GetParticipantsState> {
  GetParticipantsBloc() : super(Loading()) {
    on<LoadParticipants>((event, emit) async {
      emit(Loading());
      print('Load Participant Event Called');
      ExamRepository examRepository = getIt<ExamRepository>();
      await Future.delayed(Duration(seconds: 2));
      final dataState = await examRepository.getExamParticipants(event.exam);
      if (dataState is DataSuccess){
        var j = jsonDecode(dataState.data);
        List<Participant> participants = List<Participant>.from(j.map((e) => Participant.fromJson(e)));
        // we set participants here to be used when calling the update functionality
        ParticipantsProvider.setParticipants(participants);
        emit(ParticipantsLoaded(participants: participants));
      }
      if (dataState is DataFailed){
        emit(LoadingFailed());
      }
    });
  }
}
