import 'package:hope/features/exam/data/models/exam.dart';

class NewExamCache {
  static NewExamCache? _instance;

  NewExamCache._({  this.name,
    this.date,
    this.isExercise = false,
    this.isOpenBook = false,
    this.isFileAccessible = false,
    this.availableScore,
    this.type = 1,
    this.description = '',
    this.questionId,
    this.courseId = 2,
    this.answerId});

  factory NewExamCache() => _instance ??= NewExamCache._();

  String? name;
  DateTime? date;
  bool isExercise;
  bool isOpenBook;
  bool isFileAccessible;
  int? availableScore;
  int type;
  String description;
  int? questionId;
  int? answerId;
  int? courseId;

  // NewExamCache._internal({
  //   this.name,
  //   this.date,
  //   this.isExercise = false,
  //   this.isOpenBook = false,
  //   this.isFileAccessible = false,
  //   this.availableScore,
  //   this.type = 1,
  //   this.description = '',
  //   this.questionId,
  //   this.courseId,
  //   this.answerId});

  Exam exportCache() {
    Exam exam = Exam(id: 0,
        name: name!,
        date: date!,
        isExercise: isExercise,
        isOpenBook: isOpenBook,
        isFileAccessible: isFileAccessible,
        availableScore: availableScore!,
        type: type,
        description: description,
        questionId: questionId,
        courseId: courseId!,
        answerId: answerId);

    _instance = null; // Reset Cache after export

    return exam;
  }
}