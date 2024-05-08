import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/course/model/course.dart';
import 'package:hope/features/exam/data/exam.dart';
import 'package:hope/features/exam/data/exam_repository.dart';
import 'package:hope/locater.dart';

part 'get_exam_event.dart';
part 'get_exam_state.dart';

class GetExamBloc extends Bloc<GetExamEvent, GetExamState> {
  GetExamBloc() : super(GetExamInitial()) {
    on<RequestGetExam>((event, emit) async {
      emit(GetExamInitial());

      ExamRepository examRepository = getIt<ExamRepository>();

      //await Future.delayed(Duration(seconds: 2));

      final dataState = await examRepository.getExam(event.course);

      if (dataState is DataSuccess){
        var exams =(json.decode(dataState.data) as List).map((i) =>
            Exam.fromJson(i)).toList();
        print('success');
        emit(GetExamSuccessful(exams: exams));
      }
      if (dataState is DataFailed){
        print('failure');
        emit(GetExamFailure(error: 'error'));
      }
    });
  }
}
