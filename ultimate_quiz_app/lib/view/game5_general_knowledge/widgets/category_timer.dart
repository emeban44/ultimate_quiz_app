import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class GeneralKnowledgeCategoryTimer extends StatefulWidget {
  const GeneralKnowledgeCategoryTimer(this.confirmAnswer, {Key? key})
      : super(key: key);
  final Function(GameProvider) confirmAnswer;
  @override
  _GeneralKnowledgeCategoryTimerState createState() =>
      _GeneralKnowledgeCategoryTimerState();
}

class _GeneralKnowledgeCategoryTimerState
    extends State<GeneralKnowledgeCategoryTimer> {
  int countdown = 7;

  int percentCounter = 0;
  bool shouldRevealTruth = false;
  //bool didConfirm = false;
  Timer? _timer;
  void startTimer(GameProvider gameProvider) {
    gameProvider.generalKnowledgeCategoryTimer =
        Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        countdown--;
        if (percentCounter < 7) {
          percentCounter++;
        }
        if (countdown == 0 || timer.tick == 7) {
          timer.cancel();
          shouldRevealTruth = true;
          //widget.revealEverything();
          widget.confirmAnswer(gameProvider);
          gameProvider.game5ShouldDisableSelection = true;
        }
      });
    });
    _timer = gameProvider.generalKnowledgeCategoryTimer;
    gameProvider.game5ShouldDisableSelection = false;
  }

  @override
  void initState() {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    Future.delayed(Duration(
            milliseconds:
                gameProvider.generalKnowledgePageIndex == 0 ? 6000 : 3500))
        .whenComplete(() => startTimer(gameProvider));
    super.initState();
  }

  @override
  void dispose() {
    print('category timer disposed');
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return ShowUpAnimation(
      delayStart: Duration(
          milliseconds:
              gameProvider.generalKnowledgePageIndex == 0 ? 5500 : 3000),
      curve: Curves.linear,
      child: Container(
        margin: const EdgeInsets.only(top: 60, bottom: 10),
        child: CircularPercentIndicator(
          radius: 50,
          progressColor: Colors.pink.shade900,
          backgroundColor: Colors.transparent,
          lineWidth: 3,
          percent: 1 - percentCounter * 0.142,
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
