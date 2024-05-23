
import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/student/data/models/student_create_dto.dart';
import 'package:hope/features/student/data/models/student.dart';

abstract interface class StudentRepository{
  Future<DataState<List<Student>>> getStudents();
  Future<DataState<Student>> getStudent(String studentId);
  Future<DataState> createStudent(StudentCreateDto studentCreateDto);
  Future<DataState> updateStudent(Student updateStudent);
  Future<DataState> deleteStudent(int id);
}