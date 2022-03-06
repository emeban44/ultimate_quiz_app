import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class SortByQuestionBox extends StatelessWidget {
  const SortByQuestionBox(this.question, {Key? key}) : super(key: key);
  final String question;
  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return ShowUpAnimation(
      delayStart: Duration(
          milliseconds: gameProvider.sortByPageIndex == 0 ? 3000 : 2000),
      animationDuration: const Duration(seconds: 1),
      curve: Curves.linear,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          question,
          textAlign: TextAlign.center,
          style: const TextStyle(fontFamily: 'Signika', fontSize: 20),
        ),
      ),
    );
  }
}
