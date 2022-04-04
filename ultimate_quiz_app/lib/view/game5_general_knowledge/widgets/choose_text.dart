import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class GeneralKnowledgeChooseText extends StatelessWidget {
  const GeneralKnowledgeChooseText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return ShowUpAnimation(
      curve: Curves.decelerate,
      offset: -0.2,
      direction: Direction.vertical,
      delayStart: Duration(
          milliseconds:
              gameProvider.generalKnowledgePageIndex == 0 ? 3500 : 1000),
      animationDuration: const Duration(milliseconds: 1000),
      child: Container(
        margin: const EdgeInsets.only(top: 12.5, bottom: 5),
        child: Text(
          gameProvider.areYouChoosing
              ? 'ODABERI KATEGORIJU:'
              : 'PROTIVNIK BIRA:',
          style: const TextStyle(
            fontFamily: 'Acme',
            letterSpacing: 0.5,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
