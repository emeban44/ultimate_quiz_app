import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class SortByBottomTimer extends StatefulWidget {
  const SortByBottomTimer({Key? key}) : super(key: key);

  @override
  State<SortByBottomTimer> createState() => _SortByBottomTimerState();
}

class _SortByBottomTimerState extends State<SortByBottomTimer> {
  int countdown = 20;
  int percentCounter = 0;
  Timer? _timer;
  void startTimer(GameProvider gameProvider) {
    gameProvider.sortyByGameTimer =
        Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        countdown--;
        if (percentCounter < 20) {
          percentCounter++;
        }
        if (countdown == 0 || timer.tick == 21) {
          timer.cancel();
          //shouldRevealTruth = true;
          //widget.revealEverything();
          gameProvider.game4ShouldDisableSelection = true;
        }
      });
    });
    _timer = gameProvider.sortyByGameTimer;
    gameProvider.game4ShouldDisableSelection = false;
  }

  @override
  void initState() {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    Future.delayed(Duration(
            milliseconds: gameProvider.sortByPageIndex == 0 ? 5700 : 3750))
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
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: CircularPercentIndicator(
        radius: 45,
        progressColor: Colors.pink.shade900,
        backgroundColor: Colors.transparent,
        lineWidth: 3,
        percent: 1 - percentCounter * 0.05,
        center: Text(
          countdown.toString(),
          style: const TextStyle(
            fontFamily: 'Acme',
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
