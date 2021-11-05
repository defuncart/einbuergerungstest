import 'package:einbuergerungstest/services/question_database/models/question.dart';
import 'package:einbuergerungstest/widgets/common/buttons/question_favorite_button.dart';
import 'package:flutter/material.dart';

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
            runSpacing: 8,
            children: [
              if (question.hasImage)
                Image.asset(
                  question.imagePath!,
                  height: constraints.maxHeight == double.infinity ? 200 : constraints.maxHeight / 6,
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
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: QuestionFavoriteButton(
                      question: question,
                      alignment: Alignment.topRight,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          for (var i = 0; i < question.answers.length; i++) ...[
            if (i != 0) SizedBox(height: (DefaultTextStyle.of(context).style.fontSize ?? 16) / 4),
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
