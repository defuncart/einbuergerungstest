import 'package:einbuergerungstest/services/question_database/models/question.dart';
import 'package:einbuergerungstest/state/state.dart';
import 'package:einbuergerungstest/widgets/common/buttons/question_favorite_button.dart';
import 'package:einbuergerungstest/widgets/home_screen/question_popover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DashboardTabConsumer extends ConsumerWidget {
  const DashboardTabConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questions = ref.read(questionDatabaseProvider).allQuestions;
    return DashboardTab(
      questions: questions,
    );
  }
}

class DashboardTab extends StatelessWidget {
  const DashboardTab({
    required this.questions,
    Key? key,
  }) : super(key: key);

  final List<Question> questions;

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.green[400]!,
      Colors.purple[200]!,
      Colors.blue[500]!,
      Colors.red[400]!,
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ListView(
        children: [
          const SizedBox(height: 4),
          StaggeredGridView.countBuilder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: questions.length,
            crossAxisCount: 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            itemBuilder: (context, index) => QuestionTile(
              question: questions[index],
              color: colors[index % colors.length],
            ),
            staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
          ),
        ],
      ),
    );
  }
}

class QuestionTile extends StatelessWidget {
  const QuestionTile({
    required this.question,
    required this.color,
    this.showFavoriteButton = false,
    Key? key,
  }) : super(key: key);

  final Question question;
  final Color color;
  final bool showFavoriteButton;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Material(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          elevation: 2,
          child: GestureDetector(
            onTap: () => QuestionPopover.show(
              context,
              question: question,
            ),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: color,
                ),
                child: Text(
                  question.question,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  // softWrap: true,
                  textScaleFactor: 1,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: showFavoriteButton,
          child: QuestionFavoriteButton(
            question: question,
          ),
        ),
      ],
    );
  }
}
