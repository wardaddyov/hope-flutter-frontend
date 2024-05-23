import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/course/data/Models/course.dart';
import 'package:hope/features/course/data/Repository/course_repository.dart';
import 'package:hope/locater.dart';

part 'delete_course_event.dart';
part 'delete_course_state.dart';

class DeleteCourseBloc extends Bloc<DeleteCourseEvent, DeleteCourseState> {
  DeleteCourseBloc() : super(DeleteCourseInitial()) {
    on<RequestDeleteCourseEvent>((event, emit) async {
      // Emit the loading state
      emit(DeleteCourseProcessing());

      // Inject Repository
      CourseRepository courseRepositoryImpl = getIt<CourseRepository>();

      //Delay for visual
      await Future.delayed(Duration(seconds: 1));

      // Perform the repository call
      var dataState = await courseRepositoryImpl.deleteCourse(event.course);

      // process data and emit success if operation was successful
      if (dataState is DataSuccess){
        emit(DeleteCourseSuccessful());
      }

      // emit failure
      if (dataState is DataFailed){
        emit(DeleteCourseFailure());
      }
    });
  }
}
