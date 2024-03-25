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

  Student(
      {required this.studentID,
      required this.firstname,
      required this.lastname,
      required this.entryYear,
      required this.username,
      required this.password,
      required this.email,
      required this.phoneNumber,
      this.id});

  static Future<List<Student>> convertJsonToStudents(List studentMap) async {
    List<Student> students = [];
    for (Map student in studentMap) {
      // todo: implement username and password of students in the back and front
      Student studentObj = Student
        (
        id: student['id'],
        firstname: student['firstname'],
        lastname: student['lastname'],
        studentID: student['studentID'],
        entryYear: student['entryYear'],
        password: '-',//student['password'],
        email: 'exampl@email.com',
        phoneNumber: '09181181818',
        username: '-',
        );

      // used for searching
      studentObj.fullName = '${studentObj.firstname} ${studentObj.lastname}';
      students.add(studentObj);
    }
    return students;
  }
}
