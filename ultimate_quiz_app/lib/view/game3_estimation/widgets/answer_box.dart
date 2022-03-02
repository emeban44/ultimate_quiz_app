import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class EstimationAnswerBox extends StatelessWidget {
  EstimationAnswerBox(this.title, this.score);
  final String title;
  final double score;
  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    final bool isDecimal = gameProvider
        .estimationQuestions[gameProvider.estimationPageIndex].isDecimal!;
    return ShowUpAnimation(
      curve: Curves.easeOut,
      animationDuration: const Duration(seconds: 1),
      delayStart: Duration(milliseconds: title == 'Ti:' ? 0 : 1000),
      child: Container(
        margin: const EdgeInsets.only(top: 12.5),
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
        //padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.black38,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
              maxWidth: 140, minWidth: 80, minHeight: 40, maxHeight: 40),
          child: FittedBox(
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Signika',
                    fontSize: 22,
                    //fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                Container(
                  //height: 40,
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    score == -123456789.0
                        ? '-'
                        : score.toStringAsFixed(isDecimal ? 2 : 0),
                    style: TextStyle(
                        fontFamily: score == -123456789.0 ? 'Lexend' : 'Acme'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
