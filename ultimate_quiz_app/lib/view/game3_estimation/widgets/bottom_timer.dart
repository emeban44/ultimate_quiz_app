import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class EstimationBottomTimer extends StatefulWidget {
  // EstimationBottomTimer(this.revealEverything, this.shouldRevealEverything);
  // final Function() revealEverything;
  // final bool shouldRevealEverything;
  @override
  State<EstimationBottomTimer> createState() => _EstimationBottomTimerState();
}

class _EstimationBottomTimerState extends State<EstimationBottomTimer> {
  int countdown = 10;
  int percentCounter = 0;
  bool shouldRevealTruth = false;
  Timer? _timer;

  void startTimer(GameProvider gameProvider) {
    gameProvider.estimationGameTimer =
        Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        countdown--;
        if (percentCounter < 10) {
          percentCounter++;
        }
        if (countdown == 0 || timer.tick == 11) {
          timer.cancel();
          shouldRevealTruth = true;
          //widget.revealEverything();
          gameProvider.game3ShouldDisableSelection = true;
        }
      });
    });
    _timer = gameProvider.estimationGameTimer;
    gameProvider.game3ShouldDisableSelection = false;
  }

  @override
  void initState() {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    Future.delayed(Duration(
            milliseconds: gameProvider.estimationPageIndex == 0 ? 6000 : 4500))
        .whenComplete(() => startTimer(gameProvider));
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    final int currentPage = gameProvider.guessingPageIndex;
    return //widget.shouldRevealEverything

        shouldRevealTruth
            ? Container(
                margin: const EdgeInsets.only(bottom: 0, right: 0, left: 0),
                alignment: Alignment.center,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (gameProvider
                            .guessQuestions[currentPage].correctAnswer ==
                        gameProvider.game2SelectedAnswer)
                      ShowUpAnimation(
                        curve: Curves.easeOut,
                        animationDuration: const Duration(seconds: 1),
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: const Text(
                            '+1',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 30,
                              fontFamily: 'Acme',
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              )
            : ShowUpAnimation(
                delayStart: Duration(
                    milliseconds:
                        gameProvider.estimationPageIndex == 0 ? 5500 : 4000),
                curve: Curves.linear,
                child: Container(
                  margin: const EdgeInsets.only(top: 60, bottom: 10),
                  child: CircularPercentIndicator(
                    radius: 50,
                    progressColor: Colors.pink.shade900,
                    backgroundColor: Colors.transparent,
                    lineWidth: 3,
                    percent: 1 - percentCounter * 0.1,
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
