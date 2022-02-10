import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';
import 'package:ultimate_quiz_app/view/game2_guessing/widgets/answer_row.dart';
import 'package:ultimate_quiz_app/view/game2_guessing/widgets/bottom_timer.dart';

class GuessingAnswerColumn extends StatelessWidget {
  GuessingAnswerColumn(this.gameProvider);
  final GameProvider gameProvider;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(children: [
        ShowUpAnimation(
          delayStart: Duration(
              milliseconds: gameProvider.guessingPageIndex == 0 ? 3500 : 2000),
          curve: Curves.easeIn,
          //animationDuration: ,
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Text(
              'Pogodi ličnost sa slike:',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Signika',
                fontSize: 21,
              ),
            ),
          ),
        ),
        ShowUpAnimation(
          delayStart: Duration(
              milliseconds: gameProvider.guessingPageIndex == 0 ? 4500 : 3000),
          curve: Curves.easeIn,
          child: GuessingAnswerRow('Gavrilo Princip', 'Nikola Tesla'),
        ),
        ShowUpAnimation(
          delayStart: Duration(
              milliseconds: gameProvider.guessingPageIndex == 0 ? 5500 : 4000),
          curve: Curves.easeIn,
          child: GuessingAnswerRow('Edin Džeko', 'Neka budalčina'),
        ),
        ShowUpAnimation(
          delayStart: Duration(
              milliseconds: gameProvider.guessingPageIndex == 0 ? 6500 : 5000),
          curve: Curves.easeIn,
          child: GuessingBottomTimer(),
        ),
      ]),
    );
  }
}
