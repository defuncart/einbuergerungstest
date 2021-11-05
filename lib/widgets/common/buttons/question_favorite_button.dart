import 'package:einbuergerungstest/services/question_database/models/question.dart';
import 'package:flutter/material.dart';

class QuestionFavoriteButton extends StatefulWidget {
  const QuestionFavoriteButton({
    required this.question,
    this.padding = EdgeInsets.zero,
    this.alignment = Alignment.center,
    Key? key,
  }) : super(key: key);

  final Question question;
  final EdgeInsets padding;
  final Alignment alignment;

  @override
  State<QuestionFavoriteButton> createState() => _QuestionFavoriteButtonState();
}

class _QuestionFavoriteButtonState extends State<QuestionFavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: widget.padding,
      alignment: widget.alignment,
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
