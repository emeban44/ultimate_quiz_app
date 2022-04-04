import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

import 'category_box.dart';

class GeneralKnowledgeCategoryRow extends StatelessWidget {
  const GeneralKnowledgeCategoryRow(
      this.category1, this.category2, this.selectCategory,
      {Key? key})
      : super(key: key);
  final String category1;
  final String category2;
  final Function(GameProvider) selectCategory;
  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return ShowUpAnimation(
      direction: Direction.vertical,
      curve: Curves.linear,
      offset: 0.1,
      delayStart: Duration(
          milliseconds:
              gameProvider.generalKnowledgePageIndex == 0 ? 3500 : 1000),
      animationDuration: const Duration(seconds: 1),
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GeneralKnowledgeCategoryBox(category1, selectCategory),
            GeneralKnowledgeCategoryBox(category2, selectCategory),
          ],
        ),
      ),
    );
  }
}
