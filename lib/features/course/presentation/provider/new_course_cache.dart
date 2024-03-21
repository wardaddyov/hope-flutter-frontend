import 'package:hope/features/course/Dto/course_create_dto.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class NewCourseCache {
  static String name = '';
  static String group = '';
  static String semester = '';
  static String activationStatus = 'فعال';

  static CourseCreateDto exportCache() {
    CourseCreateDto courseCreateDto =
        CourseCreateDto(name: '', group: 0, semester: 0, activation: true);

    courseCreateDto.name = name;
    courseCreateDto.group = int.parse(group.toEnglishDigit());
    courseCreateDto.semester = int.parse(semester.toEnglishDigit());
    courseCreateDto.activation = activationStatus == 'فعال' ? true : false;
    return courseCreateDto;
  }

  static void resetNewCourseCache() {
    name = '';
    group = '';
    semester = '';
    activationStatus = 'فعال';
  }
}
