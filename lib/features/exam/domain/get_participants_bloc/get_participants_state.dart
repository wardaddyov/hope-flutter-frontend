part of 'get_participants_bloc.dart';

sealed class GetParticipantsState extends Equatable {
  const GetParticipantsState();
}

final class Loading extends GetParticipantsState {
  @override
  List<Object> get props => [];
}

final class ParticipantsLoaded extends GetParticipantsState {
  List<Participant> participants;
  ParticipantsLoaded({required this.participants});
  @override
  List<Object> get props => [participants];
}

final class LoadingFailed extends GetParticipantsState {

  @override
  List<Object> get props => [];
}
