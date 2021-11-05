import 'package:einbuergerungstest/services/question_database/models/question.dart';
import 'package:einbuergerungstest/widgets/common/question_panel.dart';
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
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.w400,
              ),
          child: QuestionPanel(
            question: question,
          ),
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
