import 'package:einbuergerungstest/services/question_database/models/question.dart';

/// A database of questions
abstract class IQuestionDatabase {
  /// Returns a [Question] for [id]
  ///
  /// Throws if [id] does not exist
  Question getQuestion(String id);

  /// Returns all 310 questions
  List<Question> get allQuestions;

  /// Returns questions for a quiz
  ///
  /// Firstly returns as many unseen questions, then as many difficult
  /// and finally the rest are random
  List<Question> get questionsForQuiz;

  /// Returns a stream of all questions
  Stream<List<Question>> get watchAllQuestions;

  /// Returns the user's favorites
  List<Question> get favorites;

  /// Returns a stream of user favorites
  Stream<List<Question>> get watchFavorites;

  /// Initializes the database
  Future<void> initialize();

  /// Resets the database
  Future<void> reset();
}
