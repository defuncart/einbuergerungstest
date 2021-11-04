import 'package:einbuergerungstest/services/question_database/enums/question_type.dart';
import 'package:hive/hive.dart';

part 'question.g.dart';

// ignore_for_file: unnecessary_getters_setters

@HiveType(typeId: 1)
class Question extends HiveObject {
  /// A unique id for the question
  @HiveField(0)
  final String id;

  /// Whether the question is Deutschland or Berlin
  @HiveField(1)
  final QuestionType type;

  /// The question itself
  @HiveField(2)
  final String question;

  /// 4 potential answers for the question
  @HiveField(3)
  List<String> answers;

  /// The correct answer's index
  @HiveField(4)
  int correctAnswerIndex;

  /// Whether the question has an image
  @HiveField(5)
  bool hasImage;

  /// Whether the answers can be re-ordered
  @HiveField(6)
  bool canBeReordered;

  /// The number of attempts
  int get attempts => _attempts;

  @HiveField(7)
  late int _attempts;

  /// The number of times correct
  int get timesCorrect => _timesCorrect;

  @HiveField(8)
  late int _timesCorrect;

  /// Whether the question is a favorite
  bool get isFavorite => _isFavorite;

  @HiveField(9)
  late bool _isFavorite;

  /// Whether the question has been seen (i.e. in a test or from dashboard)
  bool get hasBeenSeen => _hasBeenSeen;

  @HiveField(10)
  late bool _hasBeenSeen;

  /// When the question was last answered
  DateTime? get lastAnswered => _lastAnswered;

  @HiveField(11)
  DateTime? _lastAnswered;

  Question({
    required this.id,
    required this.type,
    required this.question,
    required this.answers,
    required this.correctAnswerIndex,
    required this.hasImage,
    required this.canBeReordered,
  });

  /// If [hasImage], returns the image's path
  String? get imagePath => hasImage ? 'assets/images/$id.png' : null;

  /// If the question has previously been incorrectly answered
  bool get wasAnsweredIncorrectly => _timesCorrect < _attempts;

  /// A percentage from 0 to 1 of how often the question has been correctly answered
  double get correctPercentage => _timesCorrect / attempts;

  /// Updates the progress
  void updateProgress({required bool answeredCorrectly}) {
    _attempts++;
    if (answeredCorrectly) {
      _timesCorrect++;
    }
    _lastAnswered = DateTime.now().toUtc();
    if (!_hasBeenSeen) {
      _hasBeenSeen = true;
    }
    save();
  }

  /// Updates whether question is a favorite
  set isFavorite(bool value) {
    _isFavorite = value;
    save();
  }

  void setBeenHasSeen() {
    _hasBeenSeen = true;
    save();
  }

  /// Resets the progress
  void reset() {
    _attempts = 0;
    _timesCorrect = 0;
    _isFavorite = false;
    _hasBeenSeen = false;
    _lastAnswered = null;
  }

  @override
  String toString() =>
      'Question(id: $id, attempts: $_attempts, timesCorrect: $_timesCorrect, isFavorite: $_isFavorite, lastSeen: $_lastAnswered)';
}
