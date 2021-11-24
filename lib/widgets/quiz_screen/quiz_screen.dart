import 'package:einbuergerungstest/generated/l10n.dart';
import 'package:einbuergerungstest/state/state.dart';
import 'package:einbuergerungstest/widgets/quiz_screen/quiz_view_model.dart';
import 'package:einbuergerungstest/widgets/results_screen/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizScreen extends StatelessWidget {
  static const routeName = 'QuizScreen';

  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const QuizScreenConsumer();
  }
}

@visibleForTesting
class QuizScreenConsumer extends ConsumerWidget {
  const QuizScreenConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(quizProvider);

    return QuizScreenContent(
      viewModel: viewModel,
    );
  }
}

final quizProvider = ChangeNotifierProvider.autoDispose<QuizViewModel>(
  (ref) => QuizViewModel(
    quesions: ref.read(questionDatabaseProvider).questionsForQuiz,
    onSaveResult: (result) => ref.read(resultsDatabaseProvider).addResult(result),
  ),
);

@visibleForTesting
class QuizScreenContent extends StatelessWidget {
  const QuizScreenContent({
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  final QuizViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    if (viewModel.isQuizFinished) {
      return const SizedBox.shrink();
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            final bool? shouldQuit = await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(AppLocalizations.of(context).quitQuizConfirmationDialogTitle),
                content: Text(AppLocalizations.of(context).quitQuizConfirmationDialogDescription),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(AppLocalizations.of(context).generalNo),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text(AppLocalizations.of(context).generalYes),
                  ),
                ],
              ),
            );

            if (shouldQuit == true) {
              Navigator.of(context).pop();
            }
          },
          icon: const Icon(Icons.close),
        ),
        centerTitle: true,
        title: Text('${viewModel.questionNumber} / ${viewModel.numberQuestions}'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) => LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Frage
                  if (orientation == Orientation.portrait) ...[
                    if (viewModel.imagePath != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Image.asset(
                          viewModel.imagePath!,
                          height: constraints.maxHeight / 3,
                        ),
                      ),
                    SelectableText(
                      viewModel.currentQuestion,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ] else
                    Row(
                      children: [
                        if (viewModel.imagePath != null)
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Image.asset(
                              viewModel.imagePath!,
                              width: constraints.maxWidth / 3,
                            ),
                          ),
                        Expanded(
                          child: SelectableText(
                            viewModel.currentQuestion,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 16),
                  // Antworten
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (var i = 0; i < viewModel.currentQuestionAnswers.length; i++)
                        Padding(
                          padding: EdgeInsets.only(bottom: i < 3 ? 8 : 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: AnswerButton(
                              viewModel.currentQuestionAnswers[i],
                              onPressed: () {
                                viewModel.answerCurrentQuestion(i);
                                if (viewModel.isQuizFinished) {
                                  Navigator.of(context).pushReplacementNamed(
                                    ResultsScreen.routeName,
                                    arguments: viewModel.result,
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

@visibleForTesting
class AnswerButton extends StatelessWidget {
  const AnswerButton(
    this.answer, {
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final String answer;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black38,
            ),
          ),
          alignment: Alignment.center,
          child: SelectableText(
            answer,
            onTap: onPressed,
          ),
        ),
      ),
    );
  }
}
