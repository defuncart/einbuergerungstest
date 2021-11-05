import 'package:einbuergerungstest/generated/l10n.dart';
import 'package:einbuergerungstest/services/question_database/models/question.dart';
import 'package:einbuergerungstest/state/state.dart';
import 'package:einbuergerungstest/widgets/common/questions_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TipsTabConsumer extends ConsumerWidget {
  const TipsTabConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: ref.read(questionDatabaseProvider).watchDifficult,
      initialData: ref.read(questionDatabaseProvider).difficult,
      builder: (context, snapshot) => TipsTab(questions: snapshot.data as List<Question>),
    );
  }
}

@visibleForTesting
class TipsTab extends StatelessWidget {
  const TipsTab({
    required this.questions,
    Key? key,
  }) : super(key: key);

  final List<Question> questions;

  @override
  Widget build(BuildContext context) {
    return questions.isNotEmpty
        ? QuestionsList(
            questions: questions,
            showStats: true,
          )
        : Center(
            child: Text(AppLocalizations.of(context).tipsTabEmptyStateLabel),
          );
  }
}
