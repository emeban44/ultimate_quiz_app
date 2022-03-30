import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class GeneralKnowledgeQuestionTimer extends StatefulWidget {
  const GeneralKnowledgeQuestionTimer(this.confirmAnswer, {Key? key})
      : super(key: key);
  final Function(GameProvider) confirmAnswer;
  @override
  _GeneralKnowledgeQuestionTimerState createState() =>
      _GeneralKnowledgeQuestionTimerState();
}

class _GeneralKnowledgeQuestionTimerState
    extends State<GeneralKnowledgeQuestionTimer> {
  int countdown = 25;

  int percentCounter = 0;
  bool shouldRevealTruth = false;
  //bool didConfirm = false;
  Timer? _timer;
  void startTimer(GameProvider gameProvider) {
    gameProvider.generalKnowledgeQuestionTimer =
        Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        countdown--;
        if (percentCounter < 25) {
          percentCounter++;
        }
        if (countdown == 0 || timer.tick == 25) {
          timer.cancel();
          shouldRevealTruth = true;
          //widget.revealEverything();
          widget.confirmAnswer(gameProvider);
          gameProvider.game5ShouldDisableSelection = true;
        }
      });
    });
    _timer = gameProvider.generalKnowledgeQuestionTimer;
    gameProvider.game5ShouldDisableSelection = false;
  }

  @override
  void initState() {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    Future.delayed(const Duration(milliseconds: 3500))
        .whenComplete(() => startTimer(gameProvider));
    super.initState();
  }

  @override
  void dispose() {
    print('question timer disposed');
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return ShowUpAnimation(
      delayStart: const Duration(milliseconds: 3000),
      curve: Curves.linear,
      child: Container(
        margin: const EdgeInsets.only(top: 15, bottom: 10),
        child: CircularPercentIndicator(
          radius: 50,
          progressColor: Colors.pink.shade900,
          backgroundColor: Colors.transparent,
          lineWidth: 3,
          percent: 1 - percentCounter * 0.04,
          center: Text(
            countdown.toString(),
            style: const TextStyle(
              fontFamily: 'Acme',
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
