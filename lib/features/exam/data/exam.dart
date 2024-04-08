class Exam{
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
