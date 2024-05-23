part of 'create_course_bloc.dart';

sealed class CreateCourseEvent extends Equatable {
  const CreateCourseEvent();
}

final class RequestCreateCourseEvent extends CreateCourseEvent{
  CourseCreateDto course;
  List<Student> enrolments;
  RequestCreateCourseEvent({required this.course, required this.enrolments});

  @override
  List<Object> get props => [course];
}