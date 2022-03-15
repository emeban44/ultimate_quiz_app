import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class EstimationCorrectAnswerBox extends StatelessWidget {
  EstimationCorrectAnswerBox(this.score);
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
      delayStart: const Duration(milliseconds: 2000),
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3.5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white, width: 0.4),
            boxShadow: const [
              BoxShadow(
                color: Colors.blue,
                spreadRadius: 2,
                blurRadius: 5,
              )
            ],
            gradient: LinearGradient(colors: [
              Colors.blue.shade900,
              Colors.pink.shade900,
            ])
            //color: Colors.green,
            ),
        child: Text(
          score.toStringAsFixed(isDecimal ? 2 : 0),
          style: const TextStyle(fontFamily: 'Acme'),
        ),
      ),
    );
  }
}
