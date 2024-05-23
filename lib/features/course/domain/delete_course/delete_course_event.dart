part of 'delete_course_bloc.dart';

sealed class DeleteCourseEvent extends Equatable {
  const DeleteCourseEvent();
}

final class RequestDeleteCourseEvent extends DeleteCourseEvent{
  Course course;
  RequestDeleteCourseEvent({required this.course});
  @override
  List<Object> get props => [];
}