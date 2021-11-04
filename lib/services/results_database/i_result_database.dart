import 'package:einbuergerungstest/services/results_database/models/quiz_result.dart';

/// A database of quiz results
abstract class IResultsDatabase {
  /// Returns all results (sorted by descending date)
  List<QuizResult> get allResults;

  /// Adds [result] to the database
  void addResult(QuizResult result);

  /// Initializes the database
  Future<void> initialize();

  /// Resets the database
  Future<void> reset();
}
