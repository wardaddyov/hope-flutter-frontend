import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/course/data/Models/course_create_dto.dart';
import 'package:hope/features/course/data/Repository/course_repository.dart';
import 'package:hope/features/course/data/Models/course.dart';
import 'package:hope/features/student/data/models/student.dart';
import 'package:hope/locater.dart';

part 'create_course_event.dart';

part 'create_course_state.dart';

class CreateCourseBloc extends Bloc<CreateCourseEvent, CreateCourseState> {
  CreateCourseBloc() : super(CreateCourseInitial()) {
    on<RequestCreateCourseEvent>((event, emit) async {


      emit(CreateCourseProcessing());
      await Future.delayed(Duration(seconds: 1));
      //Todo: refactor both this code and the backend code
      CourseRepository courseRepositoryImpl = getIt<CourseRepository>();
      List<int> ids = [];
      for (var obj in event.enrolments) {
        ids.add(obj.id!); // Replace 'name' with your desired property
      }
      var createCourseResult = await courseRepositoryImpl.createCourse(
          event.course, ids);
      if (createCourseResult is DataSuccess) {
        final course = Course(id: int.parse(createCourseResult.data),
            name: event.course.name,
            activation: event.course.activation,
            semester: event.course.semester,
            group: event.course.group);

        //todo: add courses to list
        //courses?.add(course);
        emit(CreateCourseSuccessful(courseId: course.id!));
      }

      if (createCourseResult is DataFailed){
        emit(CreateCourseFailure());
      }
    });
  }
}
