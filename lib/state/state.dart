import 'package:einbuergerungstest/services/question_database/hive_question_database.dart';
import 'package:einbuergerungstest/services/question_database/i_question_database.dart';
import 'package:einbuergerungstest/services/results_database/hive_results_database.dart';
import 'package:einbuergerungstest/services/results_database/i_result_database.dart';
import 'package:riverpod/riverpod.dart';

final questionDatabaseProvider = Provider<IQuestionDatabase>(
  (ref) => HiveQuestionDatabase(),
);

final resultsDatabaseProvider = Provider<IResultsDatabase>(
  (ref) => HiveResultsDatabase(),
);
