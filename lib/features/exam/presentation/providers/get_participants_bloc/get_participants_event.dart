part of 'get_participants_bloc.dart';

sealed class GetParticipantsEvent extends Equatable {
  const GetParticipantsEvent();
}

final class LoadParticipants extends GetParticipantsEvent {
  Exam exam;
  LoadParticipants({required this.exam});
  @override
  List<Object> get props => [exam];
}
