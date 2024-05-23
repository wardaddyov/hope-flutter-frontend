part of 'edit_course_bloc.dart';

sealed class EditCourseEvent extends Equatable {
  const EditCourseEvent();
}

final class RequestEditCourseEvent extends EditCourseEvent{
  Course course;
  List<Student> enrolments;
  RequestEditCourseEvent({required this.course, required this.enrolments});
  @override
  List<Object> get props => [];
}