
class Exam {
  int id;
  String name;
  DateTime date;
  bool isExercise;
  bool isOpenBook;
  bool isFileAccessible;
  int availableScore;
  int type;
  String description;
  int? questionId;
  int? answerId;
  int courseId;

  Exam(
      {required this.id,
      required this.name,
      required this.date,
      required this.isExercise,
      required this.isOpenBook,
      required this.isFileAccessible,
      required this.availableScore,
      required this.type,
      required this.description,
      required this.questionId,
      required this.courseId,
      required this.answerId});

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'date': date,
    'isExercise': isExercise,
    'isOpenBook': isOpenBook,
    'isFileAccessible': isFileAccessible,
    'availableScore': availableScore,
    'type': type,
    'description': description,
    'questionId': questionId,
    'answerId': answerId,
    'courseId': courseId
  };

  Exam.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String,
        date = json['date'] as DateTime,
        isExercise = json['isExercise'] as bool,
        isOpenBook = json['isOpenBook'] as bool,
        isFileAccessible = json['isFileAccessible'] as bool,
        description = json['description'] as String,
        availableScore = json['availableScore'] as int,
        type = json['type'] as int,
        questionId = json['questionId'] as int,
        answerId = json['answerId'] as int,
        courseId = json['courseId'] as int;
}
