import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/course/data/Models/course.dart';
import 'package:hope/features/course/data/Repository/course_repository.dart';
import 'package:hope/features/student/data/models/student.dart';
import 'package:hope/locater.dart';

part 'edit_course_event.dart';
part 'edit_course_state.dart';

class EditCourseBloc extends Bloc<EditCourseEvent, EditCourseState> {
  EditCourseBloc() : super(EditCourseInitial()) {
    on<RequestEditCourseEvent>((event, emit) async {
      // Emit the loading state
      emit(EditCourseProcessing());

      // Inject Repository
      CourseRepository courseRepositoryImpl = getIt<CourseRepository>();

      //Delay for visual
      await Future.delayed(Duration(seconds: 1));

      // Extract Ids from the enrolments provided by the event
      List<int> ids = [];
      for (var obj in event.enrolments) {
        ids.add(obj.id!);
      }

      // Perform the repository call
      var dataState = await courseRepositoryImpl.updateCourse(event.course, ids);

      // process data and emit success if operation was successful
      if (dataState is DataSuccess){
        var courses = dataState.data;

        emit(EditCourseSuccessful());
      }

      // emit failure
      if (dataState is DataFailed){
        emit(EditCourseFailure());
      }
    });
  }
}
