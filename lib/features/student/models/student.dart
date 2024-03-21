class Student {
  int? id;
  String studentID;
  String firstname;
  String lastname;
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
}
