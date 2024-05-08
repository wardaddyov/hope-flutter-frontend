import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/exam/data/exam.dart';
import 'package:hope/features/exam/data/exam_repository.dart';
import 'package:hope/features/exam/data/participant.dart';
import 'package:hope/locater.dart';

part 'update_participants_event.dart';
part 'update_participants_state.dart';

class UpdateParticipantsBloc extends Bloc<UpdateParticipantsEvent, UpdateParticipantsState> {
  UpdateParticipantsBloc() : super(UpdateParticipantsInitial()) {
    on<UpdateParticipants>((event, emit) async {
      emit(UpdateInitiated(participants: event.participants));
      print('update Participant Event Called');
      ExamRepository examRepository = getIt<ExamRepository>();
      await Future.delayed(Duration(seconds: 2));
      List participantsDto = List.from(event.participants.map((e) => e.toJson()));
      //print(participantsDto);
      final dataState = await examRepository.updateExamParticipants(event.exam, participantsDto);
      if (dataState is DataSuccess){
        emit(UpdateSuccessful());
      }
      if (dataState is DataFailed){
        emit(UpdateFailure());
      }
    });
  }
}
