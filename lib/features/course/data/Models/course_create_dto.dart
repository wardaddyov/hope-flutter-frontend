class CourseCreateDto {
  String name;
  int group;
  int semester;
  bool activation;

  CourseCreateDto(
      {required this.name,
      required this.group,
      required this.semester,
      required this.activation});
}
