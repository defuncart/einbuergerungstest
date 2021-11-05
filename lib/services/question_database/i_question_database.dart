import 'package:einbuergerungstest/services/question_database/models/question.dart';

/// A database of questions
abstract class IQuestionDatabase {
  /// Returns questions for a quiz
  ///
  /// Firstly returns as many unseen questions, then as many difficult
  /// and finally the rest are random
  List<Question> get questionsForQuiz;

  /// Returns a list of questions by [ids]
  List<Question> questionsById(List<String> ids);

  /// Returns all 310 questions
  List<Question> get allQuestions;

  /// Returns a stream of all questions
  Stream<List<Question>> get watchAllQuestions;

  /// Returns the user's favorites
  List<Question> get favorites;

  /// Returns a stream of user favorites
  Stream<List<Question>> get watchFavorites;

  /// Returns the questions which user at least once incorrectly answered (sorted by percentage then attempts)
  List<Question> get difficult;

  /// Returns a stream of user difficult questions
  Stream<List<Question>> get watchDifficult;

  /// Initializes the database
  Future<void> initialize();

  /// Resets the database
  Future<void> reset();
}
