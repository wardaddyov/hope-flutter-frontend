part of 'edit_course_bloc.dart';

sealed class EditCourseState extends Equatable {
  const EditCourseState();
}

final class EditCourseInitial extends EditCourseState {
  @override
  List<Object> get props => [];
}

final class EditCourseProcessing extends EditCourseState {
  @override
  List<Object> get props => [];
}

final class EditCourseSuccessful extends EditCourseState {

  @override
  List<Object> get props => [];
}

final class EditCourseFailure extends EditCourseState {
  @override
  List<Object> get props => [];
}
