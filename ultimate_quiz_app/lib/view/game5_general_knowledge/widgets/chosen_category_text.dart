import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';
import 'package:ultimate_quiz_app/utils/category_emojis.dart';

class GeneralKnowledgeChosenCategoryText extends StatelessWidget {
  const GeneralKnowledgeChosenCategoryText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return ShowUpAnimation(
      delayStart: const Duration(milliseconds: 0),
      animationDuration: const Duration(milliseconds: 1000),
      offset: 0.1,
      direction: Direction.vertical,
      curve: Curves.easeIn,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black38, borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        margin: const EdgeInsets.only(bottom: 15),
        child: Text(
          getCategoryEmojiTitle(gameProvider.selectedCategory!),
          style: const TextStyle(
            fontFamily: 'Acme',
            letterSpacing: 0.5,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
