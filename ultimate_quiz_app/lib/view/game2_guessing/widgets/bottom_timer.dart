import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class GuessingBottomTimer extends StatefulWidget {
  @override
  State<GuessingBottomTimer> createState() => _GuessingBottomTimerState();
}

class _GuessingBottomTimerState extends State<GuessingBottomTimer> {
  int countdown = 5;
  int percentCounter = 0;
  Timer? _timer;

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        countdown--;
        if (percentCounter < 5) {
          percentCounter++;
        }
        if (countdown == -1 || timer.tick == 6) {
          timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 7)).whenComplete(() => startTimer());
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return Container(
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
    );
  }
}
