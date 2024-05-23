part of 'update_participants_bloc.dart';

sealed class UpdateParticipantsEvent extends Equatable {
  const UpdateParticipantsEvent();
}

final class UpdateParticipants extends UpdateParticipantsEvent {
  List<Participant> participants;
  final Exam exam;
  UpdateParticipants(this.exam, {required this.participants});
  @override
  List<Object> get props => [participants, exam];
}