import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class BottomTimer extends StatefulWidget {
  BottomTimer(this.revealEverything, this.shouldRevealEverything);
  final Function() revealEverything;
  final bool shouldRevealEverything;
  @override
  State<BottomTimer> createState() => _BottomTimerState();
}

class _BottomTimerState extends State<BottomTimer> {
  int countdown = 7;
  bool shouldRevealExplanation = false;
  Timer? timer;

  void startTimer() {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    gameProvider.oddOneOutTimer =
        Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        countdown--;
        if (countdown == -1 || timer.tick == 8) {
          timer.cancel();
          shouldRevealExplanation = true;
          gameProvider.game1ShouldDisableSelection = true;
          widget.revealEverything();
        }
      });
    });
    timer = gameProvider.oddOneOutTimer;
    gameProvider.game1ShouldDisableSelection = false;
  }

  @override
  void dispose() {
    // final GameProvider gameProvider =
    //     Provider.of<GameProvider>(context, listen: false);
    // if (gameProvider.oddOneOutTimer != null) {
    //   print('provider timer');
    //   gameProvider.oddOneOutTimer!.cancel();
    // }
    print('timer disposed');

    timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    Future.delayed(Duration(
            milliseconds: gameProvider.oddOneOutPageIndex != 0 ? 5200 : 6400))
        .whenComplete(() => startTimer());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    final int currentPage = gameProvider.oddOneOutPageIndex;
    return Expanded(
      child: widget.shouldRevealEverything
          ? Container(
              margin: const EdgeInsets.only(bottom: 10, right: 25, left: 25),
              alignment: Alignment.center,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (gameProvider
                          .oddOneOutQuestions[currentPage].correctAnswer ==
                      gameProvider.game1SelectedAnswer)
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
                  ShowUpAnimation(
                    delayStart: const Duration(milliseconds: 400),
                    animationDuration: const Duration(seconds: 1),
                    curve: Curves.linear,
                    child: Container(
                      margin: const EdgeInsets.only(top: 35),
                      child: Text(
                        gameProvider
                            .oddOneOutQuestions[currentPage].explanation!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Signika',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              alignment: Alignment.center,
              child: ShowUpAnimation(
                delayStart: Duration(
                    milliseconds:
                        gameProvider.oddOneOutPageIndex != 0 ? 4750 : 6000),
                curve: Curves.easeIn,
                child: Text(
                  countdown.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 40,
                    fontFamily: 'Acme',
                  ),
                ),
              ),
            ),
    );
  }
}
