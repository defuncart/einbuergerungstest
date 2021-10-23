import 'package:hive/hive.dart';

part 'question_type.g.dart';

@HiveType(typeId: 0)
enum QuestionType {
  @HiveField(0)
  deutschland,
  @HiveField(1)
  berlin,
}
