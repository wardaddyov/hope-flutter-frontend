part of 'create_exam_bloc.dart';

sealed class CreateExamState extends Equatable {
  const CreateExamState();
}

final class CreateExamInitial extends CreateExamState {
  @override
  List<Object> get props => [];
}

final class CreateExamRequesting extends CreateExamState{
  Exam exam;
  CreateExamRequesting({required this.exam});
  @override
  List<Object> get props => [exam];
}

final class CreateExamSuccessful extends CreateExamState{
  Exam exam;
  CreateExamSuccessful({required this.exam});
  @override
  List<Object> get props => [exam];
}

final class CreateExamFailure extends CreateExamState{
  final String error;
  CreateExamFailure({required this.error});
  @override
  List<Object> get props => [];
}