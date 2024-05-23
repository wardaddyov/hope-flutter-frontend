part of 'create_course_bloc.dart';

sealed class CreateCourseState extends Equatable {
  const CreateCourseState();
}

final class CreateCourseInitial extends CreateCourseState {
  @override
  List<Object> get props => [];
}

final class CreateCourseProcessing extends CreateCourseState {
  @override
  List<Object> get props => [];
}

final class CreateCourseSuccessful extends CreateCourseState {
  int courseId;
  CreateCourseSuccessful({required this.courseId});

  @override
  List<Object> get props => [courseId];
}

final class CreateCourseFailure extends CreateCourseState {
  @override
  List<Object> get props => [];
}