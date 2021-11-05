import 'package:einbuergerungstest/services/question_database/models/question.dart';
import 'package:einbuergerungstest/widgets/common/buttons/question_favorite_button.dart';
import 'package:einbuergerungstest/widgets/common/question_popover.dart';
import 'package:flutter/material.dart';

class QuestionsList extends StatelessWidget {
  const QuestionsList({
    required this.questions,
    this.showQuestionNumber = false,
    this.shouldReduceOpacitySeenQuestion = false,
    this.showStats = false,
    Key? key,
  }) : super(key: key);

  final List<Question> questions;
  final bool showQuestionNumber;
  final bool shouldReduceOpacitySeenQuestion;
  final bool showStats;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemCount: questions.length,
      itemBuilder: (context, index) => QuestionTile(
        question: questions[index],
        questionNumber: showQuestionNumber ? index + 1 : null,
        shouldReduceOpacitySeenQuestion: shouldReduceOpacitySeenQuestion,
        showStats: showStats,
      ),
    );
  }
}

class QuestionTile extends StatelessWidget {
  const QuestionTile({
    required this.question,
    this.questionNumber,
    this.shouldReduceOpacitySeenQuestion = false,
    this.showStats = false,
    Key? key,
  }) : super(key: key);

  final Question question;
  final int? questionNumber;
  final bool shouldReduceOpacitySeenQuestion;
  final bool showStats;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: shouldReduceOpacitySeenQuestion && question.hasBeenSeen ? 0.5 : 1.0,
      child: ListTile(
        minLeadingWidth: 20,
        title: Text('${questionNumber != null ? '$questionNumber. ' : ''}${question.question}'),
        trailing: showStats
            ? Text('${question.timesCorrect} / ${question.attempts}')
            : QuestionFavoriteButton(
                question: question,
              ),
        onTap: () => QuestionPopover.show(
          context,
          question: question,
        ),
      ),
    );
  }
}
