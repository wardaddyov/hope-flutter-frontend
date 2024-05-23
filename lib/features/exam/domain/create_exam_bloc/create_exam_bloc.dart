import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/exam/data/models/exam.dart';
import 'package:hope/features/exam/data/repository/exam_repository.dart';
import 'package:hope/locater.dart';

part 'create_exam_event.dart';
part 'create_exam_state.dart';

class CreateExamBloc extends Bloc<CreateExamEvent, CreateExamState> {
  CreateExamBloc() : super(CreateExamInitial()) {
    on<RequestCreateExam>((event, emit) async {
      print('ssss');
      emit(CreateExamRequesting(exam: event.exam));
      ExamRepository examRepository = getIt<ExamRepository>();
      await Future.delayed(Duration(seconds: 2));
      final dataState = await examRepository.createExam(event.exam);
      if (dataState is DataSuccess){
        event.exam.id = int.parse(dataState.data);
        emit(CreateExamSuccessful(exam: event.exam));
      }
      if (dataState is DataFailed){
        emit(CreateExamFailure(error: 'error'));
      }
    });
  }
}
