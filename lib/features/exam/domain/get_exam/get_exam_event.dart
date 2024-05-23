part of 'get_exam_bloc.dart';

sealed class GetExamEvent extends Equatable {
  const GetExamEvent();
}

final class RequestGetExam extends GetExamEvent{
  Course course;

  RequestGetExam({required this.course});
  @override
  List<Object> get props => [course];
}
