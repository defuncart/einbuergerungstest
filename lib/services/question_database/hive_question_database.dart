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
  Question getQuestion(String id) {
    if (!_box.containsKey(id)) {
      throw ArgumentError('No question for $id found');
    }

    return _box.get(id)!;
  }

  @override
  List<Question> get allQuestions => _box.values.toList();

  @override
  Stream<List<Question>> get watchAllQuestions => _box.watch().map((event) => allQuestions);

  @override
  List<Question> get favorites => allQuestions.where((element) => element.isFavorite).toList();

  @override
  Stream<List<Question>> get watchFavorites => _box.watch().map((event) => favorites);

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
