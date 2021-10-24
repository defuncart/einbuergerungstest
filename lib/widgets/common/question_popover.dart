import 'package:einbuergerungstest/services/question_database/models/question.dart';
import 'package:einbuergerungstest/widgets/common/buttons/question_favorite_button.dart';
import 'package:flutter/material.dart';

class QuestionPopover extends StatelessWidget {
  const QuestionPopover({
    required this.question,
    Key? key,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: QuestionPanel(
          question: question,
        ),
      ),
    );
  }

  static Future<void> show(
    BuildContext context, {
    required Question question,
  }) {
    if (!question.hasBeenSeen) {
      question.setBeenHasSeen();
    }

    return showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) => QuestionPopover(question: question),
    );
  }
}

class QuestionPanel extends StatelessWidget {
  const QuestionPanel({
    required this.question,
    Key? key,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline5!,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(question.question),
              ),
              QuestionFavoriteButton(
                question: question,
              ),
            ],
          ),
          if (question.hasImage)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Center(
                child: Image.asset(question.imagePath!),
              ),
            ),
          const SizedBox(height: 16),
          for (var i = 0; i < question.answers.length; i++) ...[
            if (i != 0) const SizedBox(height: 4),
            Text(
              question.answers[i],
              style: TextStyle(
                color: i == question.correctAnswerIndex ? Colors.green : null,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
