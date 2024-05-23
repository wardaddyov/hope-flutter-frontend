
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
    'date': date.toIso8601String(),
    'isExercise': isExercise,
    'isOpenBook': isOpenBook,
    'isFileAccessible': isFileAccessible,
    'availableScore': availableScore,
    'type': type,
    'description': description,
    'questionId': null,
    'answerId': null,
    'courseId': courseId
  };

  Exam.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String,
        date = DateTime.parse(json['date']) as DateTime,
        isExercise = json['isExercise'] as bool,
        isOpenBook = json['isOpenBook'] as bool,
        isFileAccessible = json['fileAccessible'] as bool,
        description = json['description'] as String,
        availableScore = json['availableScore'] as int,
        type = json['type'] as int,
        questionId = json['questionId'],
        answerId = json['answerId'],
        courseId = json['courseId'] as int;
}
