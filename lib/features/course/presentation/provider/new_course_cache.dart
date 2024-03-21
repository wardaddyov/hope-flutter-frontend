class NewCourseCache{
  String name = '';
  String group = '';
  String semester = '';
  String activationStatus = 'فعال';

  void cacheCourse(String cname, String cgroup, String csemester){
    name = cname;
    group = cgroup;
    semester = csemester;
  }
}