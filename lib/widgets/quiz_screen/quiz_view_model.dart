import 'package:einbuergerungstest/services/question_database/models/question.dart';
import 'package:flutter/foundation.dart';

class QuizViewModel extends ChangeNotifier {
  QuizViewModel({
    required List<Question> quesions,
  }) : _questions = quesions;

  final List<Question> _questions;

  int get numberQuestions => _questions.length;

  var _currentIndex = 0;

  int get questionNumber => _currentIndex + 1;

  Question get _currentQuestion => _questions[_currentIndex];

  bool get isQuizFinished => _currentIndex >= _questions.length;

  int get correctAnswers => _correctAnswers;
  var _correctAnswers = 0;

  String get currentQuestion => _currentQuestion.question;

  List<String> get currentQuestionAnswers => _currentQuestion.answers;

  int get _currentCorrectAnswer => _currentQuestion.correctAnswerIndex;

  String? get imagePath => _currentQuestion.imagePath;

  bool get hasPassedQuiz {
    assert(isQuizFinished);

    return (_correctAnswers / numberQuestions) > 0.5;
  }

  void answerCurrentQuestion(int index) {
    assert(index >= 0 && index <= 3);

    final answeredCorrectly = _currentCorrectAnswer == index;
    _currentQuestion.updateProgress(answeredCorrectly: answeredCorrectly);
    if (answeredCorrectly) {
      _correctAnswers++;
    }

    _currentIndex++;

    notifyListeners();
  }
}
