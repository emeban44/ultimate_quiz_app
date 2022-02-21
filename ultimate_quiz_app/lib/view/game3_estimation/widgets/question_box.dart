import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class EstimationQuestionBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return ShowUpAnimation(
      delayStart: Duration(
          milliseconds: gameProvider.estimationPageIndex == 0 ? 3500 : 2000),
      curve: Curves.linear,
      //animationDuration: const Duration(milliseconds: 1000),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 2.5),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          //color: Colors.black,
          boxShadow: const [
            BoxShadow(
              color: Colors.blue,
              spreadRadius: 2,
              blurRadius: 5,
            )
          ],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white),
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade900,
              Colors.pink.shade900,
            ],
          ),
        ), //width: 250,
        child: const Text(
          'Koliko miliona stanovnika ima Njemačka?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Signika',
            fontSize: 22.5,
          ),
        ),
      ),
    );
  }
}
