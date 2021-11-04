import 'package:hive/hive.dart';

part 'quiz_result.g.dart';

@HiveType(typeId: 2)
class QuizResult {
  /// A unique id for the result
  @HiveField(0)
  final String id;

  /// A list of a question-answer pairs
  @HiveField(1)
  final List<QAPair> qaPairs;

  /// The number of questions in the quiz
  int get numberQuestions => qaPairs.length;

  /// The number of questions correctly answered
  @HiveField(2)
  final int numberCorrect;

  /// Whether test was passed
  bool get quizPassed => (numberCorrect / qaPairs.length) >= 0.5;

  /// When the test was completed
  @HiveField(3)
  final DateTime date;

  QuizResult({
    required this.id,
    required this.qaPairs,
    required this.numberCorrect,
    required this.date,
  });

  @override
  String toString() => 'QuizResult(id: $id, passed: $quizPassed, date: $date)';
}

@HiveType(typeId: 3)
class QAPair {
  @HiveField(0)
  final String questionId;

  @HiveField(1)
  final int answerIndex;

  QAPair({
    required this.questionId,
    required this.answerIndex,
  });
}
