import 'package:einbuergerungstest/services/question_database/models/question.dart';
import 'package:einbuergerungstest/widgets/common/buttons/question_favorite_button.dart';
import 'package:einbuergerungstest/widgets/common/question_popover.dart';
import 'package:flutter/material.dart';

class QuestionsList extends StatelessWidget {
  const QuestionsList({
    required this.questions,
    this.showQuestionNumber = false,
    Key? key,
  }) : super(key: key);

  final List<Question> questions;
  final bool showQuestionNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) => QuestionTile(
          question: questions[index],
          questionNumber: showQuestionNumber ? index + 1 : null,
        ),
      ),
    );
  }
}

class QuestionTile extends StatelessWidget {
  const QuestionTile({
    required this.question,
    this.questionNumber,
    Key? key,
  }) : super(key: key);

  final Question question;
  final int? questionNumber;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 1.0,
      child: ListTile(
        leading: questionNumber != null ? Text(questionNumber!.toString()) : null,
        title: Text(question.question),
        trailing: QuestionFavoriteButton(
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
