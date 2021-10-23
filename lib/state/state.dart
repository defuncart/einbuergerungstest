import 'package:einbuergerungstest/services/question_database/hive_question_database.dart';
import 'package:einbuergerungstest/services/question_database/i_question_database.dart';
import 'package:riverpod/riverpod.dart';

final questionDatabaseProvider = Provider<IQuestionDatabase>(
  (ref) => HiveQuestionDatabase(),
);
