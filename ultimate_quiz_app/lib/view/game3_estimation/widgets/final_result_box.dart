import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class EstimationFinalResultBox extends StatelessWidget {
  EstimationFinalResultBox(
      this.isCloser, this.result, this.player, this.bothPlayersWon);
  final bool isCloser;
  final int player;
  final double result;
  final bool bothPlayersWon;
  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    final bool isDecimal = gameProvider
        .estimationQuestions[gameProvider.estimationPageIndex].isDecimal!;

    return ShowUpAnimation(
      curve: Curves.easeOut,
      animationDuration: const Duration(seconds: 1),
      delayStart: Duration(milliseconds: player == 1 ? 5000 : 7000),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 40, minHeight: 35),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 7.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white, width: 0.5),
            gradient: LinearGradient(
                colors: bothPlayersWon
                    ? [Colors.green, Colors.green.shade900]
                    : isCloser
                        ? [Colors.green, Colors.green.shade900]
                        : [Colors.red, Colors.red.shade900]),
            boxShadow: [
              BoxShadow(
                color: bothPlayersWon
                    ? Colors.green
                    : isCloser
                        ? Colors.green
                        : Colors.red,
                spreadRadius: 2,
                blurRadius: 5,
              )
            ],
          ),
          child: Center(
            child: result == 0.0
                ? const Icon(Icons.check)
                : Text(
                    result == -123456789.0
                        ? '-'
                        : result.toStringAsFixed(isDecimal ? 2 : 0),
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: result == -123456789.0 ? 'Lexend' : 'Acme'),
                  ),
          ),
        ),
      ),
    );
  }
}
