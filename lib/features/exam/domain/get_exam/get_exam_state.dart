part of 'get_exam_bloc.dart';

sealed class GetExamState extends Equatable {
  const GetExamState();
}

final class GetExamInitial extends GetExamState {
  @override
  List<Object> get props => [];
}

final class GetExamSuccessful extends GetExamState {
  List<Exam> exams;
  GetExamSuccessful({required this.exams});
  @override
  List<Object> get props => [exams];
}

final class GetExamFailure extends GetExamState{
  final String error;
  GetExamFailure({required this.error});
  @override
  List<Object> get props => [];
}
