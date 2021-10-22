import 'dart:io' show Directory, File;

import 'package:einbuergerungstest/services/question_database/enums/question_type.dart';
import 'package:einbuergerungstest/services/question_database/models/question.dart';
import 'package:hive/hive.dart';

// ignore_for_file: avoid_print

void main() async {
  const outputDir = 'assets/database';

  print('#### Generating Database...    ####');

  if (await Directory(outputDir).exists()) {
    print('Removing $outputDir...');
    await Directory(outputDir).delete(recursive: true);
  }

  Hive.init(outputDir);
  Hive.registerAdapter(QuestionTypeAdapter());
  Hive.registerAdapter(QuestionAdapter());

  final box = await Hive.openBox<Question>('questions');

  await _parseFile(QuestionType.deutschland, box);
  await _parseFile(QuestionType.berlin, box);

  print('#### All done, ${box.length} question(s) ####');
}

Future<void> _parseFile(QuestionType type, Box<Question> box) async {
  const delimiter = '	';

  final file = File('assets_dev/database/${_describeEnum(type)}.tsv');
  final contents = (await file.readAsLines()).sublist(1);

  for (final line in contents) {
    final components = line.split(delimiter);

    final question = Question(
      id: components[_Keys.id],
      type: type,
      question: components[_Keys.question],
      answers: components.sublist(_Keys.a1, _Keys.answerIndex),
      correctAnswerIndex: int.parse(components[_Keys.answerIndex]),
      canBeReordered: components[_Keys.isReordable] != '0',
      hasImage: components[_Keys.hasImage] == '1',
    );

    box.add(question);
  }
}

class _Keys {
  static const id = 0;
  static const question = 1;
  static const a1 = 2;
  static const answerIndex = 6;
  static const isReordable = 7;
  static const hasImage = 8;
}

// Taken from https://api.flutter.dev/flutter/foundation/describeEnum.html
String _describeEnum(Object enumEntry) {
  final String description = enumEntry.toString();
  final int indexOfDot = description.indexOf('.');
  assert(
    indexOfDot != -1 && indexOfDot < description.length - 1,
    'The provided object "$enumEntry" is not an enum.',
  );
  return description.substring(indexOfDot + 1);
}
