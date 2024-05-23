part of 'delete_course_bloc.dart';

sealed class DeleteCourseState extends Equatable {
  const DeleteCourseState();
}

final class DeleteCourseInitial extends DeleteCourseState {
  @override
  List<Object> get props => [];
}

final class DeleteCourseProcessing extends DeleteCourseState {
  @override
  List<Object> get props => [];
}

final class DeleteCourseSuccessful extends DeleteCourseState {

  @override
  List<Object> get props => [];
}

final class DeleteCourseFailure extends DeleteCourseState {
  @override
  List<Object> get props => [];
}