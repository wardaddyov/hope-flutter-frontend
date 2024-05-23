import 'package:hope/features/exam/data/models/participant.dart';

class ParticipantsProvider{
  static List<Participant>? _participants;

  static void setParticipants(List<Participant> participants)
  {
    _participants = participants;
  }

  static List<Participant>? getParticipants()
  {
    return _participants;
  }
}