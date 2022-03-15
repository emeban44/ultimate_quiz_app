import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class EstimationResultText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      curve: Curves.easeOut,
      animationDuration: const Duration(seconds: 1),
      delayStart: const Duration(milliseconds: 3000),
      child: const Text(
        'Razlika:',
        style: TextStyle(
          fontFamily: 'Signika',
          fontSize: 22,
          //fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
