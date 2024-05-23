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

  Course.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String,
        activation = json['activation'],
        semester = json['semester'],
        group = json['group'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'activation': activation,
    'semester': semester,
    'group': group,
  };

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


