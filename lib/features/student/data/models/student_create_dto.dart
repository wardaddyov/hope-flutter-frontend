class StudentCreateDto {
  String studentID;
  String firstname;
  String lastname;
  int entryYear;
  String email;
  String phoneNumber;
  String description;

  StudentCreateDto({required this.studentID, required this.firstname, required this.lastname, required this.entryYear, this.phoneNumber = '', this.description = '', this.email = ''});
}