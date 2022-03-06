import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SortByBottomTimer extends StatefulWidget {
  const SortByBottomTimer({Key? key}) : super(key: key);

  @override
  State<SortByBottomTimer> createState() => _SortByBottomTimerState();
}

class _SortByBottomTimerState extends State<SortByBottomTimer> {
  int countdown = 20;
  int percentCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: CircularPercentIndicator(
        radius: 45,
        progressColor: Colors.pink.shade900,
        backgroundColor: Colors.transparent,
        lineWidth: 3,
        percent: 1 - percentCounter * 0.2,
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
