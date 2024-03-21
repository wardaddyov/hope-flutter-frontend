class Course {
  int? id;
  String name;
  bool activation;
  int semester;
  int group;

  Course(
      {required this.name,
      required this.activation,
      required this.semester,
      required this.group, this.id});

  static Future<List<Course>> convertJsonToCourses(List courseMap) async {
    List<Course> courses = [];
    for (Map course in courseMap) {
      Course courseObj = Course(
          id: course['id'],
          name: course['name'],
          activation: course['activation'],
          semester: course['semester'],
          group: course['group']);
      courses.add(courseObj);
    }
    return courses;
  }
}


