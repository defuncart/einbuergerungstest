import 'package:einbuergerungstest/services/question_database/models/question.dart';
import 'package:flutter/material.dart';

class QuestionFavoriteButton extends StatefulWidget {
  const QuestionFavoriteButton({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  State<QuestionFavoriteButton> createState() => _QuestionFavoriteButtonState();
}

class _QuestionFavoriteButtonState extends State<QuestionFavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: null,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {
        widget.question.isFavorite = !widget.question.isFavorite;
        setState(() {});
      },
      icon: Icon(
        widget.question.isFavorite ? Icons.favorite : Icons.favorite_outline,
      ),
    );
  }
}
