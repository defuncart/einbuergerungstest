import 'package:einbuergerungstest/services/results_database/i_result_database.dart';
import 'package:einbuergerungstest/services/results_database/models/quiz_result.dart';
import 'package:hive/hive.dart';

class HiveResultsDatabase implements IResultsDatabase {
  late Box<QuizResult> _box;

  static const _boxName = 'results';

  @override
  List<QuizResult> get allResults => _box.values.toList()..sort((a, b) => b.date.compareTo(a.date));

  @override
  void addResult(QuizResult result) => _box.add(result);

  @override
  Future<void> initialize() async {
    Hive.registerAdapter(QuizResultAdapter());
    Hive.registerAdapter(QAPairAdapter());

    _box = await Hive.openBox<QuizResult>(_boxName);
  }

  @override
  Future<void> reset() async {
    await _box.clear();
  }
}
