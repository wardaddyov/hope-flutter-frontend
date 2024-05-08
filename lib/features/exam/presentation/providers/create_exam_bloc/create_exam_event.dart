part of 'create_exam_bloc.dart';

sealed class CreateExamEvent extends Equatable {
  const CreateExamEvent();
}

final class RequestCreateExam extends CreateExamEvent {
  Exam exam;
  RequestCreateExam({required this.exam});
  @override
  List<Object> get props => [exam];
}
