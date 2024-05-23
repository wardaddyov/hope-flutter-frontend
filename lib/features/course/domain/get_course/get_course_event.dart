part of 'get_course_bloc.dart';

sealed class GetCourseEvent extends Equatable {
  const GetCourseEvent();
}

final class RequestGetCourseEvent extends GetCourseEvent{

  @override
  List<Object> get props => [];
}
