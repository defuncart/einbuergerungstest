import 'package:einbuergerungstest/services/question_database/models/question.dart';
import 'package:einbuergerungstest/state/state.dart';
import 'package:einbuergerungstest/widgets/common/questions_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardTabConsumer extends ConsumerWidget {
  const DashboardTabConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questions = ref.read(questionDatabaseProvider).allQuestions;
    return DashboardTab(
      questions: questions,
    );
  }
}

class DashboardTab extends StatelessWidget {
  const DashboardTab({
    required this.questions,
    Key? key,
  }) : super(key: key);

  final List<Question> questions;

  @override
  Widget build(BuildContext context) {
    return QuestionsList(
      questions: questions,
    );
  }
}
