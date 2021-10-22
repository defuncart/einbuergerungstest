// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionTypeAdapter extends TypeAdapter<QuestionType> {
  @override
  final int typeId = 0;

  @override
  QuestionType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return QuestionType.deutschland;
      case 1:
        return QuestionType.berlin;
      default:
        return QuestionType.deutschland;
    }
  }

  @override
  void write(BinaryWriter writer, QuestionType obj) {
    switch (obj) {
      case QuestionType.deutschland:
        writer.writeByte(0);
        break;
      case QuestionType.berlin:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
