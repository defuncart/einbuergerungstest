import 'package:einbuergerungstest/services/question_database/enums/question_type.dart';
import 'package:hive/hive.dart';

part 'question.g.dart';

@HiveType(typeId: 1)
class Question {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final QuestionType type;

  @HiveField(2)
  final String question;

  @HiveField(3)
  List<String> answers;

  @HiveField(4)
  int correctAnswerIndex;

  @HiveField(5)
  bool hasImage;

  @HiveField(6)
  bool canBeReordered;

  Question({
    required this.id,
    required this.type,
    required this.question,
    required this.answers,
    required this.correctAnswerIndex,
    required this.hasImage,
    required this.canBeReordered,
  });

  String? get imagePath => hasImage ? 'assets/images/$id.png' : null;
}
