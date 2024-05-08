part of 'update_participants_bloc.dart';

sealed class UpdateParticipantsState extends Equatable {
  const UpdateParticipantsState();
}

final class UpdateParticipantsInitial extends UpdateParticipantsState {
  @override
  List<Object> get props => [];
}

final class UpdateInitiated extends UpdateParticipantsState {
  List<Participant> participants;
  UpdateInitiated({required this.participants});
  @override
  List<Object> get props => [participants];
}

final class UpdateSuccessful extends UpdateParticipantsState {
  @override
  List<Object> get props => [];
}

final class UpdateFailure extends UpdateParticipantsState {
  @override
  List<Object> get props => [];
}