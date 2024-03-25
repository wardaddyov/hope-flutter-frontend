import 'package:hope/features/student/dto/student_create_dto.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class Student {
  int? id;
  String studentID;
  String firstname;
  String lastname;
  late String fullName;
  int entryYear;
  String username;
  String password;
  String email;
  String phoneNumber;
  String description;

  //todo: make the constructor convert the values to persian digit
  Student({required this.studentID,
    required this.firstname,
    required this.lastname,
    required this.entryYear,
    required this.username,
    required this.password,
    required this.email,
    required this.phoneNumber,
    this.id,
    required this.description});

  Student.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        studentID = json['studentID'] as String,
        firstname = json['firstname'] as String,
        lastname = json['lastname'] as String,
        entryYear = json['entryYear'] as int,
        phoneNumber = json['phoneNumber'] as String,
        description = json['description'] as String,
        email = json['email'] as String,
        password = '',
        username = '';

        static Future<List<Student>>

  convertJsonToStudents(List studentMap) async {
    List<Student> students = [];
    for (Map student in studentMap) {
      // todo: implement username and password of students in the back and front
      Student studentObj = Student(
        id: student['id'],
        firstname: student['firstname'],
        lastname: student['lastname'],
        studentID: student['studentID'],
        entryYear: student['entryYear'],
        password: "student['password']",
        email: student['email'],
        phoneNumber: student['phoneNumber'],
        username: "student['username']",
        description: student['description'],
      );

      // used for searching
      studentObj.fullName = '${studentObj.firstname} ${studentObj.lastname}';
      students.add(studentObj);
    }
    return students;
  }
}
