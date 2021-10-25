import 'package:einbuergerungstest/services/question_database/models/question.dart';
import 'package:einbuergerungstest/state/state.dart';
import 'package:einbuergerungstest/widgets/common/questions_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesTabConsumer extends ConsumerWidget {
  const FavoritesTabConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: ref.read(questionDatabaseProvider).watchFavorites,
      initialData: ref.read(questionDatabaseProvider).favorites,
      builder: (context, snapshot) => FavoritesTab(questions: snapshot.data as List<Question>),
    );
  }
}

@visibleForTesting
class FavoritesTab extends StatelessWidget {
  const FavoritesTab({
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
