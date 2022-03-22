import 'package:flutter/material.dart';
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
    return ShowUpAnimation(
      direction: Direction.vertical,
      curve: Curves.elasticInOut,
      offset: -0.5,
      delayStart: const Duration(milliseconds: 2850),
      animationDuration: const Duration(seconds: 4),
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
