import 'package:einbuergerungstest/services/question_database/models/question.dart';

/// A database of questions
abstract class IQuestionDatabase {
  /// Returns a [Question] for [id]
  ///
  /// Throws if [id] does not exist
  Question getQuestion(String id);

  /// Returns all 310 questions
  List<Question> get allQuestions;

  /// Initializes the database
  Future<void> initialize();

  /// Resets the database
  Future<void> reset();
}
