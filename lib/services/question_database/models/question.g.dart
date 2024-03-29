// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionAdapter extends TypeAdapter<Question> {
  @override
  final int typeId = 1;

  @override
  Question read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Question(
      id: fields[0] as String,
      type: fields[1] as QuestionType,
      question: fields[2] as String,
      answers: (fields[3] as List).cast<String>(),
      correctAnswerIndex: fields[4] as int,
      hasImage: fields[5] as bool,
      canBeReordered: fields[6] as bool,
    )
      .._attempts = fields[7] as int
      .._timesCorrect = fields[8] as int
      .._isFavorite = fields[9] as bool
      .._hasBeenSeen = fields[10] as bool
      .._lastAnswered = fields[11] as DateTime?;
  }

  @override
  void write(BinaryWriter writer, Question obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.question)
      ..writeByte(3)
      ..write(obj.answers)
      ..writeByte(4)
      ..write(obj.correctAnswerIndex)
      ..writeByte(5)
      ..write(obj.hasImage)
      ..writeByte(6)
      ..write(obj.canBeReordered)
      ..writeByte(7)
      ..write(obj._attempts)
      ..writeByte(8)
      ..write(obj._timesCorrect)
      ..writeByte(9)
      ..write(obj._isFavorite)
      ..writeByte(10)
      ..write(obj._hasBeenSeen)
      ..writeByte(11)
      ..write(obj._lastAnswered);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
