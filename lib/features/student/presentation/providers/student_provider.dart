import 'package:flutter/cupertino.dart';
import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/student/dto/student_create_dto.dart';
import 'package:hope/features/student/models/student.dart';
import 'package:hope/features/student/repository/student_repository_impl.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class StudentProvider extends ChangeNotifier {
  List<Student>? students;
  List<Student> filteredStudents = [];

  bool? loadFailure;
  bool? createFailure;
  bool? updateFailure;

  StudentRepositoryImpl studentRepositoryImpl = StudentRepositoryImpl();

  void getStudent() async {


    await Future.delayed(Duration(seconds: 2));
    final dataState = await studentRepositoryImpl.getStudents();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      students = dataState.data!;
      filteredStudents = students!;
      loadFailure = false;
    }

    if (dataState is DataFailed) {
      loadFailure = true;
    }

    notifyListeners();
  }

  void createStudent(StudentCreateDto studentCreateDto) async {

    //await Future.delayed(Duration(seconds: 2));
    final dataState = await studentRepositoryImpl.createStudent(
        studentCreateDto);
    if (dataState is DataSuccess) {
      createFailure = false;
      final dataState = await studentRepositoryImpl.getStudent(studentCreateDto.studentID);
      if (dataState is DataSuccess)
        {
          students?.add(dataState.data!);
        }

      // Student student = Student(studentID: studentCreateDto.studentID,
      //     firstname: studentCreateDto.firstname,
      //     lastname: studentCreateDto.lastname,
      //     entryYear: studentCreateDto.entryYear,
      //     username: 'username',
      //     password: 'password',
      //     email: studentCreateDto.email,
      //     phoneNumber: studentCreateDto.phoneNumber,
      //     description: studentCreateDto.description,
      // );

    }

    if (dataState is DataFailed) {
      createFailure = true;
    }

    notifyListeners();
  }

  void updateStudent(Student updatedStudent) async {

    final dataState = await studentRepositoryImpl.updateStudent(
        updatedStudent);

    if (dataState is DataSuccess) {
      updateFailure = false;
    }
    if (dataState is DataFailed) {
      updateFailure = true;
    }
    notifyListeners();
  }

  void deleteStudent(int id) async {

    final dataState = await studentRepositoryImpl.deleteStudent(
        id);

    if (dataState is DataSuccess) {
      students?.removeWhere((element) => element.id == id);
      updateFailure = false;
    }
    if (dataState is DataFailed) {
      updateFailure = true;
    }

    notifyListeners();
  }

  void filterStudents(List<Student> student) {
    filteredStudents = student;
    notifyListeners();
  }

  void sortStudentsById() {
    students?.sort((a, b) =>
        double.parse(a.studentID).compareTo(double.parse(b.studentID.toEnglishDigit())));
    notifyListeners();
  }

  void sortStudentsByName() {
    students?.sort((a, b) => a.lastname.compareTo(b.lastname));
    notifyListeners();
  }
}