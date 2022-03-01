import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class EstimationCorrectAnswerBox extends StatelessWidget {
  EstimationCorrectAnswerBox(this.score);
  final int score;
  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      curve: Curves.easeOut,
      animationDuration: const Duration(seconds: 1),
      delayStart: const Duration(milliseconds: 3000),
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 3.5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.white, width: 0.4),
            boxShadow: const [
              BoxShadow(
                color: Colors.blue,
                spreadRadius: 2,
                blurRadius: 5,
              )
            ],
            gradient: LinearGradient(colors: [
              Colors.blue.shade900,
              Colors.pink.shade900,
            ])
            //color: Colors.green,
            ),
        child: Text(
          score.toString(),
          style: const TextStyle(fontFamily: 'Acme'),
        ),
      ),
    );
  }
}
