import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/course/data/Repository/course_repository.dart';
import 'package:hope/features/course/data/Models/course.dart';
import 'package:hope/locater.dart';

part 'get_course_event.dart';
part 'get_course_state.dart';

class GetCourseBloc extends Bloc<GetCourseEvent, GetCourseState> {
  /// I can have access to the courses in two sections
  /// one would be in this file
  /// the other is to make another file that would store my courses
  /// at the moment I don't know how i should approach the problem
  ///
  GetCourseBloc() : super(GetCourseInitial()) {
    on<RequestGetCourseEvent>((event, emit) async {
      // Emit the loading state
      emit(GetCourseProcessing());

      // Inject Repository
      CourseRepository courseRepositoryImpl = getIt<CourseRepository>();

      //Delay for visual
      await Future.delayed(Duration(seconds: 1));

      // Perform the repository call
      var dataState = await courseRepositoryImpl.getCourses();

      // process data and emit success if operation was successful
      if (dataState is DataSuccess){
        var courses = dataState.data;

        emit(GetCourseSuccessful(courses: courses!));
      }

      // emit failure
      if (dataState is DataFailed){
        emit(GetCourseFailure());
      }
    });
  }
}
