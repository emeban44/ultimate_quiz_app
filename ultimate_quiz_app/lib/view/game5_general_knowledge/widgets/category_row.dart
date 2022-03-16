import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

import 'category_box.dart';

class GeneralKnowledgeCategoryRow extends StatelessWidget {
  const GeneralKnowledgeCategoryRow(this.category1, this.category2, {Key? key})
      : super(key: key);
  final String category1;
  final String category2;
  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      direction: Direction.vertical,
      curve: Curves.elasticInOut,
      offset: -1,
      delayStart: Duration(milliseconds: 4000),
      animationDuration: Duration(seconds: 2),
      child: Opacity(
        opacity: 0.5,
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GeneralKnowledgeCategoryBox(category1),
              GeneralKnowledgeCategoryBox(category2),
            ],
          ),
        ),
      ),
    );
  }
}
