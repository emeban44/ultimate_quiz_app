import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class EstimationCorrectAnswerText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      curve: Curves.easeOut,
      animationDuration: const Duration(seconds: 1),
      delayStart: const Duration(milliseconds: 2000),
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        child: const Text(
          'Tačan odgovor:',
          style: TextStyle(
            fontFamily: 'Signika',
            fontSize: 22,
            //fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
