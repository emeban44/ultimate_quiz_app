import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class SortByQuestionBox extends StatelessWidget {
  const SortByQuestionBox(this.question, {Key? key}) : super(key: key);
  final String question;
  @override
  Widget build(BuildContext context) {
    print(question.length);
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return ShowUpAnimation(
      delayStart: Duration(
          milliseconds: gameProvider.sortByPageIndex == 0 ? 3200 : 1600),
      animationDuration: const Duration(seconds: 1),
      curve: Curves.linear,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 90, minHeight: 30),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            question,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Signika',
                fontSize: question.length > 130 ? 16 : 18),
          ),
        ),
      ),
    );
  }
}
