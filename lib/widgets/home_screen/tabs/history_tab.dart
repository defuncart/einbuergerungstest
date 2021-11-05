import 'package:einbuergerungstest/generated/l10n.dart';
import 'package:einbuergerungstest/services/results_database/models/quiz_result.dart';
import 'package:einbuergerungstest/state/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryTabConsumer extends ConsumerWidget {
  const HistoryTabConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HistoryTab(
      results: ref.read(resultsDatabaseProvider).allResults,
    );
  }
}

class HistoryTab extends StatelessWidget {
  const HistoryTab({
    required this.results,
    Key? key,
  }) : super(key: key);

  final List<QuizResult> results;

  @override
  Widget build(BuildContext context) {
    return results.isNotEmpty
        ? ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(
                results[index].date.toString(),
                style: TextStyle(
                  color: results[index].quizPassed ? Colors.green : Colors.red,
                ),
              ),
              trailing: Text('${results[index].numberCorrect} / ${results[index].numberQuestions}'),
              onTap: () {},
            ),
          )
        : Center(
            child: Text(AppLocalizations.of(context).historyTabEmptyStateLabel),
          );
  }
}
