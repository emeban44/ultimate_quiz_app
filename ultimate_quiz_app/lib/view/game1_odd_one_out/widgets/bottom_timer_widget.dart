import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class BottomTimer extends StatefulWidget {
  BottomTimer(this.revealEverything);
  final Function() revealEverything;
  @override
  State<BottomTimer> createState() => _BottomTimerState();
}

class _BottomTimerState extends State<BottomTimer> {
  int countdown = 10;
  bool shouldRevealExplanation = false;
  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        countdown--;
        if (countdown == -1 || timer.tick == 11) {
          timer.cancel();
          shouldRevealExplanation = true;
          widget.revealEverything();
        }
      });
    });
  }

  @override
  void initState() {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    Future.delayed(
            Duration(seconds: gameProvider.oddOneOutPageIndex != 0 ? 5 : 8))
        .whenComplete(() => startTimer());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return Expanded(
      child: shouldRevealExplanation
          ? Container(
              margin: const EdgeInsets.only(bottom: 10, right: 25, left: 25),
              alignment: Alignment.center,
              child: ShowUpAnimation(
                delayStart: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
                child: const Text(
                  '( Jedan od ponuđenih nije teniser. )',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Signika',
                  ),
                ),
              ),
            )
          : Container(
              alignment: Alignment.center,
              child: ShowUpAnimation(
                delayStart: Duration(
                    seconds: gameProvider.oddOneOutPageIndex != 0 ? 4 : 7),
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
