import 'dart:async';

import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class BottomTimer extends StatefulWidget {
  BottomTimer(this.revealEverything);
  final Function() revealEverything;
  @override
  State<BottomTimer> createState() => _BottomTimerState();
}

class _BottomTimerState extends State<BottomTimer> {
  int countdown = 5;
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
    Future.delayed(const Duration(seconds: 5)).whenComplete(() => startTimer());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: shouldRevealExplanation
          ? Container(
              margin: const EdgeInsets.only(bottom: 10),
              alignment: Alignment.center,
              child: ShowUpAnimation(
                delayStart: const Duration(seconds: 0),
                curve: Curves.easeIn,
                child: const Text(
                  'Jedan od ponuđenih nije teniser.',
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
                delayStart: const Duration(seconds: 4),
                curve: Curves.easeIn,
                child: Text(
                  countdown.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    fontFamily: 'Acme',
                  ),
                ),
              ),
            ),
    );
  }
}
