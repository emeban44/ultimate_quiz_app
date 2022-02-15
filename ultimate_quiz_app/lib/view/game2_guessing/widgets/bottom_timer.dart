import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class GuessingBottomTimer extends StatefulWidget {
  GuessingBottomTimer(this.revealEverything, this.shouldRevealEverything);
  final Function() revealEverything;
  final bool shouldRevealEverything;
  @override
  State<GuessingBottomTimer> createState() => _GuessingBottomTimerState();
}

class _GuessingBottomTimerState extends State<GuessingBottomTimer> {
  int countdown = 5;
  int percentCounter = 0;
  bool shouldRevealTruth = false;
  Timer? _timer;

  void startTimer(GameProvider gameProvider) {
    gameProvider.guessingGameTimer =
        Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        countdown--;
        if (percentCounter < 5) {
          percentCounter++;
        }
        if (countdown == 0 || timer.tick == 6) {
          timer.cancel();
          shouldRevealTruth = true;
          widget.revealEverything();
          gameProvider.game2ShouldDisableSelection = true;
        }
      });
    });
    _timer = gameProvider.guessingGameTimer;
    gameProvider.game2ShouldDisableSelection = false;
  }

  @override
  void initState() {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    Future.delayed(
            Duration(seconds: gameProvider.guessingPageIndex == 0 ? 7 : 7))
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
    return widget.shouldRevealEverything

        // if (gameProvider
        //                       .oddOneOutQuestions[currentPage].correctAnswer ==
        //                   gameProvider.game1SelectedAnswer)
        // ? ShowUpAnimation(
        //     curve: Curves.easeOut,
        //     delayStart: const Duration(milliseconds: 600),
        //     animationDuration: const Duration(seconds: 1),
        //     child: Container(
        //       margin: const EdgeInsets.only(top: 10),
        //       child: const Text(
        //         '+1',
        //         style: TextStyle(
        //           color: Colors.green,
        //           fontSize: 30,
        //           fontFamily: 'Acme',
        //         ),
        //       ),
        //     ),
        //   )
        ? Container(
            margin: const EdgeInsets.only(bottom: 0, right: 0, left: 0),
            alignment: Alignment.center,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (gameProvider.guessQuestions[currentPage].correctAnswer ==
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
            delayStart: const Duration(milliseconds: 500),
            curve: Curves.linear,
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              child: CircularPercentIndicator(
                radius: 50,
                progressColor: Colors.purple,
                backgroundColor: Colors.transparent,
                percent: 1 - percentCounter * 0.2,
                center: Text(
                  countdown.toString(),
                  style: TextStyle(
                    fontFamily: 'Acme',
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          );
  }
}
