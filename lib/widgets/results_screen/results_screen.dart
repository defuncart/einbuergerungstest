import 'package:einbuergerungstest/generated/l10n.dart';
import 'package:flutter/material.dart';

class ResultsScreenArguments {
  const ResultsScreenArguments({
    required this.numberQuestions,
    required this.numberCorrectAnswers,
    required this.hasPassedQuiz,
  });

  final int numberQuestions;
  final int numberCorrectAnswers;
  final bool hasPassedQuiz;
}

class ResultsScreen extends StatelessWidget {
  static const routeName = 'ResultsScreen';

  const ResultsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as ResultsScreenArguments;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                arguments.hasPassedQuiz
                    ? AppLocalizations.of(context).resultsScreenPassedText(
                        arguments.numberCorrectAnswers,
                        arguments.numberQuestions,
                      )
                    : AppLocalizations.of(context).resultsScreenFailedText(
                        arguments.numberCorrectAnswers,
                        arguments.numberQuestions,
                      ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  AppLocalizations.of(context).generalContinue,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
