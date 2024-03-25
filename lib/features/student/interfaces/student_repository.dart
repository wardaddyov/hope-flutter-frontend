
import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/student/dto/student_create_dto.dart';
import 'package:hope/features/student/models/student.dart';

abstract class StudentRepository{
  Future<DataState<List<Student>>> getStudents();
  Future<DataState<Student>> getStudent();
  Future<DataState> createStudent(StudentCreateDto studentCreateDto);
  Future<DataState> updateStudent(StudentCreateDto studentCreateDto);
}