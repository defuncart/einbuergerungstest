import 'package:einbuergerungstest/generated/l10n.dart';
import 'package:einbuergerungstest/services/question_database/models/question.dart';
import 'package:einbuergerungstest/services/results_database/models/quiz_result.dart';
import 'package:einbuergerungstest/state/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultsScreen extends StatelessWidget {
  static const routeName = 'ResultsScreen';

  const ResultsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final result = ModalRoute.of(context)?.settings.arguments as QuizResult?;
    if (result == null) {
      Navigator.of(context).pop();
    }

    return ResultsScreenConsumer(
      result: result!,
    );
  }
}

@visibleForTesting
class ResultsScreenConsumer extends ConsumerWidget {
  const ResultsScreenConsumer({required this.result, Key? key}) : super(key: key);

  final QuizResult result;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResultsScreenContent(
      result: result,
      questions: ref.read(questionDatabaseProvider).questionsById(
            result.qaPairs.map((p) => p.questionId).toList(),
          ),
    );
  }
}

class ResultsScreenContent extends StatelessWidget {
  const ResultsScreenContent({
    required this.result,
    required this.questions,
    Key? key,
  }) : super(key: key);

  final QuizResult result;
  final List<Question> questions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                result.quizPassed
                    ? AppLocalizations.of(context).resultsScreenPassedText(
                        result.numberCorrect,
                        result.numberQuestions,
                      )
                    : AppLocalizations.of(context).resultsScreenFailedText(
                        result.numberCorrect,
                        result.numberQuestions,
                      ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  AppLocalizations.of(context).generalContinue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
