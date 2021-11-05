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
    this.answerIndex,
    Key? key,
  }) : super(key: key);

  final Question question;
  final int? answerIndex;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            runSpacing: 16,
            children: [
              if (question.hasImage)
                Image.asset(
                  question.imagePath!,
                  height: constraints.maxHeight / 6,
                ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      question.question,
                      style: DefaultTextStyle.of(context).style.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  QuestionFavoriteButton(
                    question: question,
                    alignment: Alignment.topRight,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: question.hasImage ? 16 : 0),
          for (var i = 0; i < question.answers.length; i++) ...[
            if (i != 0) const SizedBox(height: 2),
            Text(
              question.answers[i],
              style: TextStyle(
                color: i == question.correctAnswerIndex ? Colors.green : (i == answerIndex ? Colors.red : null),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
