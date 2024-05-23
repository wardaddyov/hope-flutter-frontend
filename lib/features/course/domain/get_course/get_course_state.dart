part of 'get_course_bloc.dart';

sealed class GetCourseState extends Equatable {
  const GetCourseState();
}

final class GetCourseInitial extends GetCourseState {
  @override
  List<Object> get props => [];
}

final class GetCourseProcessing extends GetCourseState {
  @override
  List<Object> get props => [];
}

final class GetCourseSuccessful extends GetCourseState {
  List<Course> courses;
  GetCourseSuccessful({required this.courses});
  @override
  List<Object> get props => [];
}

final class GetCourseFailure extends GetCourseState {
  @override
  List<Object> get props => [];
}
