import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class GeneralKnowledgeChanceToStealPoints extends StatelessWidget {
  const GeneralKnowledgeChanceToStealPoints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      delayStart: const Duration(milliseconds: 3000),
      curve: Curves.linear,
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: const Text(
          'Imaš šansu ukoliko protivnik odgovori netačno...',
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Signika', fontSize: 14),
        ),
      ),
    );
  }
}
