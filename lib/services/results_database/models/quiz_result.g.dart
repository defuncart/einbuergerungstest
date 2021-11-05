// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_result.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuizResultAdapter extends TypeAdapter<QuizResult> {
  @override
  final int typeId = 2;

  @override
  QuizResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuizResult(
      id: fields[0] as String,
      qaPairs: (fields[1] as List).cast<QAPair>(),
      numberCorrect: fields[2] as int,
      date: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, QuizResult obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.qaPairs)
      ..writeByte(2)
      ..write(obj.numberCorrect)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuizResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class QAPairAdapter extends TypeAdapter<QAPair> {
  @override
  final int typeId = 3;

  @override
  QAPair read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QAPair(
      questionId: fields[0] as String,
      answerIndex: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, QAPair obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.questionId)
      ..writeByte(1)
      ..write(obj.answerIndex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QAPairAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
