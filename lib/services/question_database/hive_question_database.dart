import 'dart:io';

import 'package:einbuergerungstest/services/question_database/enums/question_type.dart';
import 'package:einbuergerungstest/services/question_database/i_question_database.dart';
import 'package:einbuergerungstest/services/question_database/models/question.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveQuestionDatabase implements IQuestionDatabase {
  late Box<Question> _box;

  static const _boxName = 'questions';

  @override
  List<Question> get questionsForQuiz {
    const numberQuestions = 33;
    final questions = <Question>[];

    // take as many non-seen questions as possible
    var notSeen = allQuestions.where((q) => !q.hasBeenSeen);
    if (notSeen.length >= numberQuestions) {
      notSeen = notSeen.toList()..shuffle();
      return notSeen.take(numberQuestions).toList();
    }
    questions.addAll(notSeen);

    // take at most numberRemainingQuestions / 2 difficult questions
    final difficult = allQuestions.where((q) => q.wasAnsweredIncorrectly);
    difficult.toList().sort((a, b) => a.correctPercentage.compareTo(b.correctPercentage));
    var numberRemainingQuestions = numberQuestions - questions.length;
    final maxNumberDifficultQuestions = (numberRemainingQuestions * 0.5).floor();
    questions.addAll(difficult.take(maxNumberDifficultQuestions));

    // randomly choose remaining
    numberRemainingQuestions = numberQuestions - questions.length;
    final remainingQuestions = allQuestions.where((q) => !questions.contains(q));
    remainingQuestions.toList().shuffle();
    questions.addAll(remainingQuestions.take(numberRemainingQuestions));

    // finally shuffle and return
    assert(questions.length == numberQuestions);
    questions.shuffle();
    return questions;
  }

  @override
  List<Question> questionsById(List<String> ids) => ids.map(_getQuestion).toList();

  Question _getQuestion(String id) => allQuestions.firstWhere((q) => q.id == id);

  @override
  List<Question> get allQuestions => _box.values.toList();

  @override
  Stream<List<Question>> get watchAllQuestions => _box.watch().map((_) => allQuestions);

  @override
  List<Question> get favorites => allQuestions.where((q) => q.isFavorite).toList();

  @override
  Stream<List<Question>> get watchFavorites => _box.watch().map((_) => favorites);

  @override
  List<Question> get difficult => allQuestions.where((q) => q.wasAnsweredIncorrectly).toList()
    ..sort((a, b) => '${1 - b.correctPercentage}-${b.attempts}'.compareTo('${1 - a.correctPercentage}-${a.attempts}'));

  @override
  Stream<List<Question>> get watchDifficult => _box.watch().map((_) => difficult);

  @override
  Future<void> initialize() async {
    Hive.registerAdapter(QuestionTypeAdapter());
    Hive.registerAdapter(QuestionAdapter());

    final file = File(await _deviceFilepath);
    if (!await file.exists()) {
      final asset = await rootBundle.load('assets/database/questions.hive');
      await file.writeAsBytes(asset.buffer.asUint8List(asset.offsetInBytes, asset.lengthInBytes));
    }

    _box = await Hive.openBox<Question>(_boxName);
  }

  @override
  Future<void> reset() async {
    final file = File(await _deviceFilepath);
    if (await file.exists()) {
      await file.delete();
    }

    await initialize();
  }

  Future<String> get _deviceFilepath async {
    final dir = (await getApplicationDocumentsDirectory()).path;
    return '$dir/questions.hive';
  }
}
