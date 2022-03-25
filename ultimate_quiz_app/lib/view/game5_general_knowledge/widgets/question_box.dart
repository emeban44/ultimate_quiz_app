import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class GeneralKnowledgeQuestionBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return ShowUpAnimation(
      delayStart: const Duration(milliseconds: 1000),
      animationDuration: const Duration(milliseconds: 1000),
      curve: Curves.easeIn,
      offset: 0.1,
      //animationDuration: const Duration(milliseconds: 1000),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
        padding:
            const EdgeInsets.only(bottom: 12, top: 10, left: 30, right: 30),
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: const [
            BoxShadow(
              color: Colors.blue,
              spreadRadius: 1,
              blurRadius: 2,
            )
          ],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white, width: 0.5),
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade900,
              Colors.pink.shade900,
            ],
          ),
        ), //width: 250,
        child: Text(
          'Za koji film je Leonardo DiCaprio osvojio Oskara 2014. godine?',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Signika',
            fontSize: 20,
            letterSpacing: 0.4,
          ),
        ),
      ),
    );
  }
}
