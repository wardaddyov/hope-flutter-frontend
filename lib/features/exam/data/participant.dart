
import 'dart:convert';

class Participant {
  String firstname;
  String lastname;
  String studentIdFull;
  int examId;
  int studentId;
  double? score;


  Participant(
      {required this.studentIdFull, this.score, required this.firstname, required this.lastname, required this.examId, required this.studentId});

  Map<String, dynamic> toJson() => {
    'examId': examId,
    'studentId': studentId,
    'score': score?.toDouble()
  };

  Participant.fromJson(Map<String, dynamic> json)
      : firstname = json['firstname'] as String,
        lastname = json['lastname'] as String,
        studentIdFull = json['studentIdFull'] as String,
        score = json['score'],
        examId = json['examId'],
        studentId = json['studentId'];
}
